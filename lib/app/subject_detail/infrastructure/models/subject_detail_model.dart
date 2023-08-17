class SubjectDetailModel {
  final String id;
  final String subjectName;
  final int year;
  final int semester;
  final String imageUrl;
  final String description;
  final bool isOptional;
  final List<LectureModel> theoreticalLecture;
  final List<LectureModel> practicalLecture;
  final List<VideoModel> videos;
  final List<PrevExamModel> previousExam;
  final List<String> questions;

  const SubjectDetailModel({
    required this.id,
    required this.subjectName,
    required this.year,
    required this.semester,
    required this.description,
    required this.isOptional,
    required this.imageUrl,
    required this.practicalLecture,
    required this.theoreticalLecture,
    required this.videos,
    required this.previousExam,
    required this.questions,
  });

  copyWith({
    String? id,
    String? subjectName,
    int? year,
    int? semester,
    String? imageUrl,
    String? description,
    bool? isOptional,
    List<LectureModel>? theoreticalLecture,
    List<LectureModel>? practicalLecture,
    List<VideoModel>? videos,
    List<PrevExamModel>? previousExam,
    List<String>? questions,
  }) {
    return SubjectDetailModel(
      id: id ?? this.id,
      subjectName: subjectName ?? this.subjectName,
      year: year ?? this.year,
      semester: semester ?? this.semester,
      description: description ?? this.description,
      isOptional: isOptional ?? this.isOptional,
      imageUrl: imageUrl ?? this.imageUrl,
      practicalLecture: practicalLecture ?? this.practicalLecture,
      theoreticalLecture: theoreticalLecture ?? this.theoreticalLecture,
      videos: videos ?? this.videos,
      previousExam: previousExam ?? this.previousExam,
      questions: questions ?? this.questions,
    );
  }

  factory SubjectDetailModel.fromJson(Map<String, dynamic> json) {
    return SubjectDetailModel(
      id: json['id'],
      subjectName: json['name'],
      year: json['year'],
      semester: json['semester'],
      description: json['description'],
      isOptional: json['isOptional'],
      imageUrl: json['imageUrl'],
      practicalLecture: (json['practicalLecture'] as List).map((e) => LectureModel.fromJson(e)).toList(),
      theoreticalLecture: (json['theoreticalLecture'] as List).map((e) => LectureModel.fromJson(e)).toList(),
      previousExam: (json['previousExam'] as List).map((e) => PrevExamModel.fromJson(e)).toList(),
      videos: (json['video'] as List).map((e) => VideoModel.fromJson(e)).toList(),
      questions: (json['questions'] as List).map((e) => e.toString()).toList(),
    );
  }
}

class LectureModel {
  final String id;
  final String name;
  final int expectedPeriod;
  final DateTime dateCreated;
  final String lectureUrl;

  const LectureModel({
    required this.id,
    required this.name,
    required this.expectedPeriod,
    required this.dateCreated,
    required this.lectureUrl,
  });

  factory LectureModel.fromJson(Map<String, dynamic> json) {
    return LectureModel(
      id: json['id'],
      name: json['name'],
      expectedPeriod: json['expectedPeriod'],
      dateCreated: DateTime.parse(DateTime.now().toString()),
      lectureUrl: json['url'],
    );
  }
}

class VideoModel {
  final String id;
  final String videoName;
  final int duration;
  final DateTime dateCreated;

  const VideoModel({
    required this.id,
    required this.videoName,
    required this.duration,
    required this.dateCreated,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'],
      videoName: json['name'],
      duration: json['duration'],
      dateCreated: DateTime.parse(json['dateCreated']),
    );
  }
}

class PrevExamModel {
  final String pdfUrl;
  final String name;
  final int year;
  final int term;

  const PrevExamModel({
    required this.pdfUrl,
    required this.name,
    required this.year,
    required this.term,
  });

  factory PrevExamModel.fromJson(Map<String, dynamic> json) {
    return PrevExamModel(
      pdfUrl: json['pdfUrl'],
      name: json['name'],
      year: json['year'],
      term: json['term'],
    );
  }
}
