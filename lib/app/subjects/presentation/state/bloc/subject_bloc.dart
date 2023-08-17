import 'dart:typed_data';

import 'package:bot_toast/bot_toast.dart';
import 'package:equatable/equatable.dart';
import 'package:ez_learn_dashboard/common/helper/bloc_status.dart';
import 'package:ez_learn_dashboard/common/result_builder/result.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../common/imports/imports.dart';
import '../../../application/subject_facade.dart';
import '../../../domain/entities/subject_param.dart';
import '../../../infrastructure/models/subject_model.dart';

part 'subject_event.dart';

part 'subject_state.dart';

class SubjectBloc extends Bloc<SubjectEvent, SubjectState> {
  final SubjectFacade _facade;

  SubjectBloc({required SubjectFacade facade})
      : _facade = facade,
        super(const SubjectState()) {
    on<SubjectEvent>((event, emit) async {
      if (event is GetAllSubject) {
        await getAllSubject(event, emit);
      } else if (event is AddSubject) {
        await addSubject(event, emit);
      }
    });
  }

  getAllSubject(GetAllSubject event, Emitter emit) async {
    emit(state.copyWith(result: const Result.loading()));
    final result = await _facade.getAllSubject();
    result.fold(
      (left) {
        emit(state.copyWith(result: Result.error(error: left)));
      },
      (right) {
        emit(state.copyWith(result: Result.loaded(data: right)));
      },
    );
  }

  addSubject(AddSubject event, Emitter emit) async {
    final val = state.result.getDataWhenSuccess()!;
    BotToast.showLoading();
    emit(state.copyWith(status: const BlocStatus.loading()));
    final param = SubjectParam(
      subjectName: form.control(name).value,
      year: form.control(year).value,
      semester: form.control(semester).value,
      description: form.control(description).value,
      isOptional: form.control(isOptional).value,
      imageUrl: form.control(image).value,
    );
    final result = await _facade.addSubject(param);
    result.fold(
      (left) {
        emit(state.copyWith(status:  BlocStatus.fail(error: left)));
        BotToast.showText(text: 'حدث خطأ ما!، أعد المحاولة');
        BotToast.closeAllLoading();
      },
      (right) {
        val.add(right);
        emit(state.copyWith(status: const BlocStatus.success()));
        BotToast.showText(text: 'تمت الإضافة بنجاح');

        BotToast.closeAllLoading();
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
  });

  static const String name = 'name';
  static const String year = 'year';
  static const String semester = 'semester';
  static const String description = 'description';
  static const String isOptional = 'isOptional';
  static const String image = 'image';




}
