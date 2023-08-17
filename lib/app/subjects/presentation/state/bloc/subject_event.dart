part of 'subject_bloc.dart';

@immutable
abstract class SubjectEvent {}

class GetAllSubject extends SubjectEvent{}

class AddSubject extends SubjectEvent{}