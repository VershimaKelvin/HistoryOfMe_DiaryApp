import 'package:flutter/material.dart';
import 'package:history_of_me/controller/localization/hom_localizations.dart';
import 'package:history_of_me/model/user_data.dart';
import 'package:leitmotif/leitmotif.dart';

import 'change_name_dialog.dart';

/// A widget displaying the user's analytics and basic customization options.
///
/// This includes an user icon, a button allowing to change the username and a
/// card listing the user's statistics.
class UserProfileCard extends StatefulWidget {
  /// The provided [UserData].
  final UserData userData;

  /// A callback to handle the 'on pressed' action.
  final void Function() onPressedUserIcon;

  /// Creates a [UserProfileCard].
  const UserProfileCard({
    Key? key,
    required this.userData,
    required this.onPressedUserIcon,
  }) : super(key: key);
  @override
  _UserProfileCardState createState() => _UserProfileCardState();
}

class _UserProfileCardState extends State<UserProfileCard> {
  void _showChangeNameDialog() {
    LitRouteController(context).showDialogWidget(ChangeNameDialog(
      userData: widget.userData,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return LitConstrainedSizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _UserIcon(
              userData: widget.userData,
              onPressedUserIcon: widget.onPressedUserIcon,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 22.0,
                bottom: 12.0,
              ),
              child: ClippedText(
                "${widget.userData.name}",
                style: LitSansSerifStyles.h6,
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return SizedBox(
                  width: constraints.maxWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: constraints.maxWidth / 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: ClippedText(
                                HOMLocalizations(context).diaryCreated + ":",
                                style: LitSansSerifStyles.caption,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: ClippedText(
                                DateTime.fromMillisecondsSinceEpoch(
                                  widget.userData.created,
                                ).formatAsLocalizedDate(context),
                                style: LitSansSerifStyles.subtitle2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 16.0,
              ),
              child: Align(
                alignment: Alignment.center,
                child: LitRoundedElevatedButton(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6.0,
                    horizontal: 12.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 13.0,
                      color: Colors.black12,
                      offset: Offset(-1, 1),
                      spreadRadius: 1.0,
                    )
                  ],
                  color: LitColors.mintGreen,
                  child: ClippedText(
                    HOMLocalizations(context).changeName.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: LitSansSerifStyles.button,
                  ),
                  onPressed: _showChangeNameDialog,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A widget displaying a colored user icon.
class _UserIcon extends StatefulWidget {
  /// The provided [UserData].
  final UserData userData;

  /// The size which accounts for both, width and height.
  final double size;
  final void Function() onPressedUserIcon;
  const _UserIcon({
    Key? key,
    required this.userData,
    this.size = 96.0,
    required this.onPressedUserIcon,
  }) : super(key: key);

  @override
  __UserIconState createState() => __UserIconState();
}

class __UserIconState extends State<_UserIcon> {
  /// Returns a stylized user color.
  Color get _userColor {
    Color uColor = Color(widget.userData.primaryColor);
    Color contrastColor = Color(0xFFDDDDDD);
    int alpha = uColor.alpha;
    int red = (uColor.red * 0.8).floor();
    int green = (uColor.green * 0.8).floor();
    int blue = (uColor.blue * 0.8).floor();
    Color desatColor = Color.fromARGB(alpha, red, green, blue);
    return Color.lerp(contrastColor, desatColor, 0.3)!;
  }

  /// Returns the initials of the user derived by the username.
  String get _usernameInitials {
    String initals = "";
    List<String> names = "${widget.userData.name}".split(" ");
    // Add the first character of each substring (name elements).
    for (String nameElement in names) {
      if (initals.length < 3) {
        initals = initals + nameElement.substring(0, 1);
      }
    }

    return initals;
  }

  @override
  Widget build(BuildContext context) {
    return CleanInkWell(
      onTap: widget.onPressedUserIcon,
      child: Container(
        height: widget.size,
        width: widget.size,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Colors.black26,
              offset: Offset(
                -3.5,
                2.5,
              ),
              spreadRadius: -3.0,
            )
          ],
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.white, _userColor]),
          borderRadius: BorderRadius.all(Radius.circular(38.0)),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: ClippedText(
              _usernameInitials,
              style: LitSansSerifStyles.h5.copyWith(
                fontSize: 34.0,
                color: _userColor.computeLuminance() >= 0.5
                    ? Colors.white
                    : Color(0xFF888888),
                fontWeight: FontWeight.w700,
                letterSpacing: 1.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
