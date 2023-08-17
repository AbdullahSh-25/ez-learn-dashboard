import 'package:ez_learn_dashboard/common/constant/app_url.dart';
import 'package:ez_learn_dashboard/common/imports/imports.dart';

String yearConverter(int year) {
  switch (year) {
    case 1:
      return 'السنة الأولى';
    case 2:
      return 'السنة الثانية';
    case 3:
      return 'السنة الثالثة';
    case 4:
      return 'السنة الرابعة';
    case 5:
      return 'السنة الخامسة';
    default:
      return 'غير محدد';
  }
}

String semesterConverter(int semester) {
  switch (semester) {
    case 0:
      return 'الفصل الأول';
    case 1:
      return 'الفصل الثاني';
    default:
      return 'غير محدد';
  }
}

String buildDocPath(String path) {
  final url = Uri.parse(AppUrl.baseUrlDevelopment + path).toString();
  printR(url);
  return url;
}
