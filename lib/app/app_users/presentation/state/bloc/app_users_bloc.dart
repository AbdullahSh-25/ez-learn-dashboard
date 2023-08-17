import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ez_learn_dashboard/app/subject_detail/domain/entities/lecture_param.dart';
import 'package:meta/meta.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../common/result_builder/result.dart';
import '../../../application/app_users_facade.dart';
import '../../../infrastructure/models/app_users_model.dart';

part 'app_users_event.dart';

part 'app_users_state.dart';

class AppUsersBloc extends Bloc<AppUsersEvent, AppUsersState> {
  final AppUsersFacade _facade;

  AppUsersBloc({required AppUsersFacade facade})
      : _facade = facade,
        super(const AppUsersState()) {
    on<AppUsersEvent>((event, emit) async {
      if (event is GetAllAppUsers) {
        await getAllAppUsers(event, emit);
      }
    });
  }

  getAllAppUsers(GetAllAppUsers event, Emitter emit) async {
    emit(state.copyWith(result: const Result.loading()));
    final result = await _facade.getAllAppUsers();
    result.fold(
      (left) {
        emit(state.copyWith(result: Result.error(error: left)));
      },
      (right) {
        emit(state.copyWith(result: Result.loaded(data: right)));
      },
    );
  }

  static final form = FormGroup({
    name: FormControl(),
    year: FormControl(),
    semester: FormControl(),
    description: FormControl(),
    isOptional: FormControl<bool>(),
    image: FormControl<Uint8List>(),
    imagePath: FormControl(),
  });

  static const String name = 'name';
  static const String year = 'year';
  static const String expectedTime = 'expectedTime';
  static const String semester = 'semester';
  static const String description = 'description';
  static const String isOptional = 'isOptional';
  static const String image = 'image';
  static const String imagePath = 'image_path';
  static const String file = 'file';
  static const String filePath = 'file_path';
}
