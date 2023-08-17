part of 'subject_detail_bloc.dart';

@immutable
class SubjectDetailState extends Equatable {
  final Result<SubjectDetailModel> result;

  const SubjectDetailState({
    this.result = const Result.init(),
  });

  SubjectDetailState copyWith({
    Result<SubjectDetailModel>? result,
  }) {
    return SubjectDetailState(
      result: result ?? this.result,
    );
  }

  @override
  List<Object> get props => [result];
}
