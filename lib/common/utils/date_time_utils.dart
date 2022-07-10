class DateTimeUtil {
  static DateTime? utcStringToLocal(String? input) {
    if (input==null||input.isEmpty) return null;
    return DateTime.tryParse(input)?.toLocal();
  }

  static String? localDateTimeToUTCString(DateTime input) {

    return input.toUtc().toIso8601String();
  }
}
