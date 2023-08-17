part of 'dash_users_bloc.dart';

@immutable
class DashUsersState extends Equatable {
  final Result<List<DashUsersModel>> result;

  const DashUsersState({
    this.result = const Result.init(),
  });

  DashUsersState copyWith({
    Result<List<DashUsersModel>>? result,
  }) {
    return DashUsersState(
      result: result ?? this.result,
    );
  }

  @override
  List<Object> get props => [result];
}
