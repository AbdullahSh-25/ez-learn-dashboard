import 'package:intl/intl.dart';

extension DateConverter on String {
  String fullDate() {
    final dateTime = DateTime.parse(this);
    final date = DateFormat('yyyy-MM-dd', 'en-us').format(dateTime.toLocal());
    final time = DateFormat('hh:mm', 'en-us').format(dateTime.toLocal());
    final status = DateFormat('a', 'en-us').format(dateTime.toLocal());
    return '($time$status) $date';
  }

  String date() {
    final dateTime = DateTime.parse(this);
    final date = DateFormat('EEE d, MMM yyyy', 'en-us').format(dateTime.toLocal());
    return date;
  }

  String time() {
    final dateTime = DateTime.parse(this);
    final time = DateFormat('HH:mm', 'en-us').format(dateTime.toLocal());
    return time;
  }

  String fromTimeSpan() {
    final time = this;
    final timeSplit = time.split(':');
    final converted = DateTime(2020, 0, 0, int.parse(timeSplit[0]), int.parse(timeSplit[1]));
    return converted.toString().time();
  }

  static String since(String data) {
    final time = DateTime.parse(data);
    final full = DateTime.now().difference(time);
    if (full.inMinutes < 1) {
      return ' 1 دقيقة';
    } else if (full.inMinutes < 60) {
      return ' ${full.inMinutes} دقائق';
    } else if (full.inHours < 24) {
      return ' ${full.inHours} ساعات';
    } else if (full.inDays < 30) {
      return ' ${full.inDays} أيام';
    } else if (full.inDays > 30 && full.inDays < 365) {
      final month = full.inDays / 30;
      return ' ${month.toInt()} شهر';
    } else if (full.inDays > 365) {
      final year = full.inDays / 365;
      return ' ${year.toInt()} سنة';
    }
    return 'd';
  }
}


extension DateTimeExt on DateTime{
  String toDate(){
    return DateFormat('yyyy-MM-dd', 'en-us').format(this);
  }
}

extension TimeAgo on int{
  convertToTime() {
    final int num = this ~/ 60;
    if (num < 1) {
      return '$this دقيقة ';
    } else {
      return '$num ساعة ${this % 60} دقيقة ';
    }
  }
}

extension DateTimeUS on DateTime{
  String toUSDate(){
    return DateFormat('MM/dd/yyyy').format(this);
  }
}