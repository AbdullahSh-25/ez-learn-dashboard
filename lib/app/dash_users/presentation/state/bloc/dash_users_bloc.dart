import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ez_learn_dashboard/app/subject_detail/domain/entities/lecture_param.dart';
import 'package:meta/meta.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../common/result_builder/result.dart';
import '../../../application/dash_users_facade.dart';
import '../../../infrastructure/models/dash_users_model.dart';

part 'dash_users_event.dart';

part 'dash_users_state.dart';

class DashUsersBloc extends Bloc<DashUsersEvent, DashUsersState> {
  final DashUsersFacade _facade;

  DashUsersBloc({required DashUsersFacade facade})
      : _facade = facade,
        super(const DashUsersState()) {
    on<DashUsersEvent>((event, emit) async {
      if (event is GetAllDashUsers) {
        await getAllDashUsers(event, emit);
      }
    });
  }

  getAllDashUsers(GetAllDashUsers event, Emitter emit) async {
    emit(state.copyWith(result: const Result.loading()));
    final result = await _facade.getAllDashUsers();
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
