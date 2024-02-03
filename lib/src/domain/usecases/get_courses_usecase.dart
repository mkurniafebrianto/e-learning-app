import 'package:e_learning/src/data/repositories/course_repository.dart';
import 'package:e_learning/src/domain/entities/course_model.dart';
import 'package:e_learning/src/domain/usecases/usecase.dart';

class GetCoursesUseCase
    implements UseCase<List<CourseData>?, GetCoursesParams> {
  final CourseRepository courseRepository;

  GetCoursesUseCase(this.courseRepository);

  @override
  Future<List<CourseData>?> call(params) async {
    return await courseRepository.getCourses(
      majorName: params.majorName,
      userEmail: params.userEmail,
    );
  }
}

class GetCoursesParams {
  final String majorName;
  final String userEmail;

  GetCoursesParams({
    required this.majorName,
    required this.userEmail,
  });
}
