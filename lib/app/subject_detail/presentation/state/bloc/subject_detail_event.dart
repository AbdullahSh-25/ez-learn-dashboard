part of 'subject_detail_bloc.dart';

@immutable
abstract class SubjectDetailEvent {}

class GetSubjectById extends SubjectDetailEvent {
  final String subjectId;

  GetSubjectById(this.subjectId);
}

class AddLecture extends SubjectDetailEvent {
  final String subjectId;
  final int type;

  AddLecture(this.subjectId,this.type);
}