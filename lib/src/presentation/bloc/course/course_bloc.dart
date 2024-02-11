import 'package:bloc/bloc.dart';
import 'package:e_learning/src/domain/usecases/get_courses_usecase.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/course_model.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final GetCoursesUseCase getCoursesUseCase;

  CourseBloc(this.getCoursesUseCase) : super(CourseInitial()) {
    on<CourseEvent>((event, emit) async {
      if (event is GetCoursesEvent) {
        emit(GetCoursesLoading());

        final courses = await getCoursesUseCase(
          GetCoursesParams(
            majorName: 'IPA',
            userEmail: 'testerngbayu@gmail.com',
          ),
        );

        if (courses != null) {
          emit(GetCoursesSuccess(courseList: courses));
        } else {
          emit(GetCoursesError(errorMessage: 'Server Error'));
        }
      }
    });
  }
}
