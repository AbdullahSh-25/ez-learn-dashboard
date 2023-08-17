import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ez_learn_dashboard/app/subject_detail/domain/entities/lecture_param.dart';
import 'package:meta/meta.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../common/result_builder/result.dart';
import '../../../application/subject_detail_facade.dart';
import '../../../infrastructure/models/subject_detail_model.dart';

part 'subject_detail_event.dart';

part 'subject_detail_state.dart';

class SubjectDetailBloc extends Bloc<SubjectDetailEvent, SubjectDetailState> {
  final SubjectDetailFacade _facade;

  SubjectDetailBloc({required SubjectDetailFacade facade})
      : _facade = facade,
        super(const SubjectDetailState()) {
    on<SubjectDetailEvent>((event, emit) async {
      if (event is GetSubjectById) {
        await getSubjectById(event, emit);
      } else if (event is AddLecture) {
        await addLecture(event, emit);
      }
    });
  }

  getSubjectById(GetSubjectById event, Emitter emit) async {
    emit(state.copyWith(result: const Result.loading()));
    final result = await _facade.getSubjectById(event.subjectId);
    result.fold(
      (left) {
        emit(state.copyWith(result: Result.error(error: left)));
      },
      (right) {
        form.control(name).value = right.subjectName;
        form.control(year).value = right.year;
        form.control(semester).value = right.semester;
        form.control(description).value = right.description;
        form.control(imagePath).value = right.imageUrl;
        emit(state.copyWith(result: Result.loaded(data: right)));
      },
    );
  }

  addLecture(AddLecture event, Emitter emit) async {
    final s = state.result.getDataWhenSuccess()!;
    final lectureParam;
    if(event.type==1) {
      lectureParam = LectureParam(
        subjectId: event.subjectId,
        name: theoLecForm
            .control(name)
            .value,
        expectedPeriod: int.parse(theoLecForm
            .control(expectedTime)
            .value),
        type: event.type,
        url: theoLecForm
            .control(file)
            .value,
        fileName: theoLecForm
            .control(filePath)
            .value,
      );
    } else{
      lectureParam = LectureParam(
        subjectId: event.subjectId,
        name: pracLecForm
            .control(name)
            .value,
        expectedPeriod: int.parse(pracLecForm
            .control(expectedTime)
            .value),
        type: event.type,
        url: pracLecForm
            .control(file)
            .value,
        fileName: pracLecForm
            .control(filePath)
            .value,
      );
    }
    final result = await _facade.addLecture(lectureParam);
    result.fold(
      (left) {
        emit(state.copyWith(result: Result.error(error: left)));
      },
      (right) {
        s.theoreticalLecture.add(right);

        emit(
          state.copyWith(
            result: Result.loaded(
              data: s.copyWith(theoreticalLecture: s.theoreticalLecture),
            ),
          ),
        );
      },
    );
  }

  static final theoLecForm = FormGroup({
    name: FormControl<String>(),
    expectedTime: FormControl(),
    file: FormControl<Uint8List>(),
    filePath: FormControl(),
  });

  static final videoForm = FormGroup({
    name: FormControl<String>(),
    expectedTime: FormControl(),
    file: FormControl<Uint8List>(),
    filePath: FormControl(),
  });


  static final pracLecForm = FormGroup({
    name: FormControl<String>(),
    expectedTime: FormControl(),
    file: FormControl<Uint8List>(),
    filePath: FormControl(),
  });

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
