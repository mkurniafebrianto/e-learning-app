import 'package:bloc/bloc.dart';
import 'package:e_learning/data/model/course/course_model.dart';
import 'package:e_learning/data/repository/course_repository.dart';
import 'package:meta/meta.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(CourseInitial()) {
    on<CourseEvent>((event, emit) async {
      if (event is GetCourseEvent) {
        emit(CourseLoding());

        final courseRepository = CourseRepository();
        final response = await courseRepository.getCourses();

        emit(CourseSuccess(courseList: response.data ?? []));
      }
    });
  }
}
