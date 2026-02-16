import 'package:intl/intl.dart';
class DateFormatter {
  DateFormatter._();
  static String formatReleaseDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) {
      return 'Unknown';
    }
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('MMM dd, yyyy').format(date);
    } catch (e) {
      return dateString;
    }
  }
  static String getYear(String? dateString) {
    if (dateString == null || dateString.isEmpty) {
      return 'N/A';
    }
    try {
      final date = DateTime.parse(dateString);
      return date.year.toString();
    } catch (e) {
      return 'N/A';
    }
  }
  static String formatRuntime(int? minutes) {
    if (minutes == null || minutes == 0) {
      return 'N/A';
    }
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    if (hours == 0) {
      return '${mins}m';
    } else if (mins == 0) {
      return '${hours}h';
    } else {
      return '${hours}h ${mins}m';
    }
  }
}