import 'package:e_learning/src/data/repositories/excercise_repository.dart';
import 'package:e_learning/src/domain/usecases/usecase.dart';

import '../entities/excercise_model.dart';

class GetExcercisesUseCase
    implements UseCase<List<ExcerciseData>?, GetExcercisesParams> {
  final ExcerciseRepository excerciseRepository;

  GetExcercisesUseCase(this.excerciseRepository);

  @override
  Future<List<ExcerciseData>?> call(params) async {
    return await excerciseRepository.getExcercises(
      courseId: params.courseId,
      userEmail: params.userEmail,
    );
  }
}

class GetExcercisesParams {
  final String courseId;
  final String userEmail;

  GetExcercisesParams({
    required this.courseId,
    required this.userEmail,
  });
}
