import 'package:bloc/bloc.dart';
import 'package:e_learning/src/domain/usecases/get_excercises_usecase.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/excercise_model.dart';

part 'excercise_state.dart';

class ExcerciseCubit extends Cubit<ExcerciseState> {
  final GetExcercisesUseCase getExcercisesUseCase;

  ExcerciseCubit(this.getExcercisesUseCase) : super(ExcerciseInitial());

  Future<void> getExcercises(String courseId) async {
    emit(GetExcerciseLoading());

    final excercises = await getExcercisesUseCase(
      GetExcercisesParams(
        courseId: courseId,
        userEmail: 'testerngbayu@gmail.com',
      ),
    );

    if (excercises != null) {
      emit(GetExcerciseSuccess(excerciseList: excercises));
    } else {
      emit(GetExcerciseError(errorMessage: 'Server Error'));
    }
  }
}
