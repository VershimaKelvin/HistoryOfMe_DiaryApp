import 'package:flutter/material.dart';

class HistoryOfMeLauncherIconArt extends StatelessWidget {
  final BorderRadius borderRadius;
  final double height;
  final double width;
  const HistoryOfMeLauncherIconArt({
    Key? key,
    this.borderRadius = const BorderRadius.all(
      const Radius.circular(24.0),
    ),
    this.height = 84.0,
    this.width = 84.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(height / 4)),
          color: Color(0xFFFFF7EF),
        ),
        child: Padding(
          padding: EdgeInsets.all(height / 4),
          child: Image(
            image:
                AssetImage("assets/images/History_Of_Me_Key_Icon_256px-01.png"),
          ),
        ),
      ),
    );
  }
}
