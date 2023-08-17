part of 'app_users_bloc.dart';

@immutable
class AppUsersState extends Equatable {
  final Result<List<AppUsersModel>> result;

  const AppUsersState({
    this.result = const Result.init(),
  });

  AppUsersState copyWith({
    Result<List<AppUsersModel>>? result,
  }) {
    return AppUsersState(
      result: result ?? this.result,
    );
  }

  @override
  List<Object> get props => [result];
}
