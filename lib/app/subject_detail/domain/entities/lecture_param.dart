import 'dart:typed_data';

import 'package:dio/dio.dart';

class LectureParam {
  final String subjectId;
  final String name;
  final int expectedPeriod;
  final int type;
  final Uint8List url;
  final String fileName;

  LectureParam({
    required this.subjectId,
    required this.name,
    required this.expectedPeriod,
    required this.type,
    required this.url,
    required this.fileName
  });

  Map<String, dynamic> toJson() {
    return {
      'SubjectId': subjectId,
      'Name': name,
      'ExpectedPeriod': expectedPeriod,
      'Type': type,
      'Url': MultipartFile.fromBytes(url,filename: fileName),
    };
  }
}
