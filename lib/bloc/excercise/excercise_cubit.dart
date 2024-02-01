import 'package:bloc/bloc.dart';
import 'package:e_learning/data/model/course/excercise_model.dart';
import 'package:e_learning/data/repository/excercise_repository.dart';
import 'package:meta/meta.dart';

part 'excercise_state.dart';

class ExcerciseCubit extends Cubit<ExcerciseState> {
  ExcerciseCubit() : super(ExcerciseInitial());

  void getExcercises(String courseId) async {
    emit(ExcerciseLoading());

    final excerciseRepository = ExcerciseRepository();

    final response = await excerciseRepository.getExcercises(courseId);

    emit(ExcerciseSuccess(excerciseList: response.data ?? []));
  }
}
