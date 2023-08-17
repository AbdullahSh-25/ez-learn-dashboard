part of 'subject_bloc.dart';

@immutable
class SubjectState extends Equatable {
  final Result<List<SubjectModel>> result;
  final BlocStatus status;

  const SubjectState({
    this.result = const Result.init(),
    this.status = const BlocStatus.initial(),
  });

  SubjectState copyWith({
    Result<List<SubjectModel>>? result,
    BlocStatus? status,
  }) {
    return SubjectState(
      result: result ?? this.result,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [result, status];
}
