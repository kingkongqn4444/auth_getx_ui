import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  static const timeFormatHHMMA = 'HH.mma';
  static const dateFormatMMMddYYY = 'MMM dd, yyyy';
  static const dateFormatMMMMddYYY = 'MMMM dd, yyyy';
  static const dateFormatMMMMYYY = 'MMMM, yyyy';
  static const dateFormatddMMMMYYY = 'dd MMMM, yyyy';
  static const dateFormatddMMMMHHmma = 'dd MMMM, HH:mma';
  static const dateFormatddMMMyyyyHHmma = 'dd MMM yyyy, HH:mma';
  static const dateFormatddMMyyyy = 'dd / MM / yyyy';
  static const dateFormatddMMMyyyy = 'dd MMM, yyyy';
  static const dateFormatHHMMddMMMyyyy = 'HH:mm - dd MMMM yyyy';
  static const dateFormatHHMMddMMyyyy = 'HH:mm dd/MM/yyyy';
  static const dateFormatyyyyMMdd = 'yyyy-MM-dd';
  static const dateFormatE = 'E';
  static const dateFormatEMMMMDDYYYY = 'EEE, MMMM dd, yyyy';
  static const dateFormatMMMM = 'MMMM';

  String get formatTimeHHMM => DateFormat.Hm().format(this);

  String get formatTimeHHMMA => DateFormat(timeFormatHHMMA).format(this);

  String get formatTimeHHMMddMMMyyyy => DateFormat(dateFormatHHMMddMMMyyyy).format(this);

  String get formatDateMMMddYYY => DateFormat(dateFormatMMMddYYY).format(this);

  String get formatDateMMMMddYYY => DateFormat(dateFormatMMMMddYYY ).format(this);

  String get formatDateFormatddMMMMYYY => DateFormat(dateFormatddMMMMYYY ).format(this);

  String get formatDateddMMyyyy => DateFormat(dateFormatddMMyyyy ).format(this);

  String get formatDateyyyyMMdd => DateFormat(dateFormatyyyyMMdd ).format(this);

  String get formatDateHHMMddMMyyyy => DateFormat(dateFormatHHMMddMMyyyy ).format(this);

  String get formatDateddMMMMHHmma => DateFormat(dateFormatddMMMMHHmma ).format(this);

  String get formatDateddMMMMyyyy => DateFormat(dateFormatMMMMYYY ).format(this);

  String get formatDateddMMMyyyy => DateFormat(dateFormatddMMMyyyy ).format(this);

  String get formatDateE => DateFormat(dateFormatE ).format(this);

  String get formatDateEMMMMDDYYYY => DateFormat(dateFormatEMMMMDDYYYY ).format(this);

  String get formatDateMMMM => DateFormat(dateFormatMMMM ).format(this);

  String get formatDateddMMMyyyyHHmmaa => DateFormat(dateFormatddMMMyyyyHHmma ).format(this);

  String formatDateTime(String formatter) => DateFormat(formatter ).format(this);

  DateTime get date => DateTime(year, month, day);

  DateTime copyWith({int? yearN, monthN, dayN}) => DateTime(yearN ?? year, monthN ?? month, dayN ?? day);

  bool differenceDateTime(DateTime date) {
    return day == date.day && month == date.month && year == date.year;
  }

  int containsDate({required List<DateTime> listDate}) {
    return listDate.indexWhere((element) => differenceDateTime(element));
  }

  String timeAgoSinceDate() {
    final date2 = DateTime.now();
    final difference = date2.difference(this);

    if ((difference.inDays / 7).floor() >= 1) {
      return formatDateMMMddYYY;
    } else if (difference.inDays >= 1) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }

  DateTime applied(TimeOfDay time) {
    return DateTime(year, month, day, time.hour, time.minute);
  }

  TimeOfDay get toTimeOfDay {
    return TimeOfDay.fromDateTime(this);
  }
}
