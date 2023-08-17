import 'dart:typed_data';

import 'package:dio/dio.dart';

class SubjectParam {
  final String subjectName;
  final int year;
  final int semester;
  final String description;
  final bool isOptional;
  final Uint8List imageUrl;

  const SubjectParam({
    required this.subjectName,
    required this.year,
    required this.semester,
    required this.description,
    required this.isOptional,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'Name': subjectName,
      'Year': year,
      'Semester': semester,
      'Description': description,
      'IsOptional': isOptional,
      'ImageUrl': MultipartFile.fromBytes(imageUrl,filename: 'name.png'),
    };
  }
}
