import 'package:flutter/material.dart';
import 'package:lit_localization_service/lit_localization_service.dart';

/// A controller class implementing HistoryOfMe's localization.
///
/// It provides an interface to access the [LitLocalizations] using the local
/// JSON asset and implements the required getter to retrieve all available
/// localized strings.
class HOMLocalizations {
  final BuildContext context;

  /// Creates a [HOMLocalizations].
  const HOMLocalizations(this.context);

  LitLocalizations get _localizations {
    return LitLocalizations.of(context)!;
  }

  String getValue(String key) {
    return _localizations.getLocalizedValue(key);
  }

  String get yourName {
    return getValue("your_name");
  }

  String get okay {
    return getValue("okay");
  }

  String get compose {
    return getValue("compose");
  }

  String get thatsMe {
    return getValue("thats_me");
  }

  String get whatShallWeCallYou {
    return getValue("what_shall_we_call_you");
  }

  String get yourDataIsSafe {
    return getValue("your_data_is_safe");
  }

  String get offlineAppDescription {
    return getValue("offline_app_description");
  }

  String get confirmYourAge {
    return getValue("confirm_your_age");
  }

  String get confirmYourAgeSubtitle {
    return getValue("confirm_your_age_subtitle");
  }

  String get yourAge {
    return getValue("your_age");
  }

  String get setAge {
    return getValue("set_age");
  }

  String get submit {
    return getValue("submit");
  }

  String get invalidAgeText {
    return getValue("invalid_age_text");
  }

  String get valid {
    return getValue("valid");
  }

  String get chooseDate {
    return getValue("choose_date");
  }

  String get createFirstEntryDescr {
    return getValue("create_first_entry_descr");
  }

  String get createEntry {
    return getValue("create_entry");
  }

  String get create {
    return getValue("create");
  }

  String get existingEntryTodayDescr {
    return getValue("existing_entry_today_descr");
  }

  String get existingEntrySelectedDayDescr {
    return getValue("existing_entry_selected_day_descr");
  }

  String get forToday {
    return getValue("for_today");
  }

  String get forPreviousDay {
    return getValue("for_previous_day");
  }

  String get addDiaryEntry {
    return getValue("add_diary_entry");
  }

  String get futureDaysNotAllowedDescr {
    return getValue("future_days_not_allowed_descr");
  }

  String get dateNotIncludedDescr {
    return getValue("date_not_included_descr");
  }

  String get untitled {
    return getValue("untitled");
  }

  String get entry {
    return getValue("entry");
  }

  String get entires {
    return getValue("entires");
  }

  String get favorite {
    return getValue("favorite");
  }

  String get latest {
    return getValue("latest");
  }

  String get first {
    return getValue("first");
  }

  String get edit {
    return getValue("edit");
  }

  String get yourMoodWas {
    return getValue("your_mood_was");
  }

  String get entryIsEmpty {
    return getValue("entry_is_empty");
  }

  String get entryIsEmptyDescr {
    return getValue("entry_is_empty_descr");
  }

  String get options {
    return getValue("options");
  }

  String get delete {
    return getValue("delete");
  }

  String get bad {
    return getValue("bad");
  }

  String get good {
    return getValue("good");
  }

  String get alright {
    return getValue("alright");
  }

  String get noFavoritesAvailable {
    return getValue("no_favorites_available");
  }

  String get noFavoritesAvailableDescr {
    return getValue("no_favorites_available_descr");
  }

  String get all {
    return getValue("all");
  }

  String get previous {
    return getValue("previous");
  }

  String get next {
    return getValue("next");
  }
}