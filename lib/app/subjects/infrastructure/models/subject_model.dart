class SubjectModel {
  //       "id": "1bc2800f-9f86-420a-bb25-60e230570b4e",
  //       "name": "Algorithms-4",
  //       "year": 3,
  //       "semester": 1,
  //       "imageUrl": "AddImage()",
  //       "videoCount": 0,
  //       "practicalLectureCount": 0,
  //       "theoreticalLectureCount": 0,
  //       "previousExamCount": 0
  final String id;
  final String name;
  final int year;
  final int semester;
  final String imageUrl;
  final int videoCount;
  final int practicalLectureCount;
  final int theoreticalLectureCount;
  final int previousExamCount;

  const SubjectModel({
    required this.id,
    required this.name,
    required this.year,
    required this.semester,
    required this.imageUrl,
    required this.videoCount,
    required this.practicalLectureCount,
    required this.theoreticalLectureCount,
    required this.previousExamCount,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      id: json['id'],
      name: json['name'],
      year: json['year'],
      semester: json['semester'],
      imageUrl: json['imageUrl'],
      videoCount: json['videoCount'],
      practicalLectureCount: json['practicalLectureCount'],
      theoreticalLectureCount: json['theoreticalLectureCount'],
      previousExamCount: json['previousExamCount'],
    );
  }
}
