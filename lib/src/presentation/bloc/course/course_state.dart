part of 'course_bloc.dart';

@immutable
sealed class CourseState {}

final class CourseInitial extends CourseState {}

/// get courses
final class GetCoursesLoading extends CourseState {}

final class GetCoursesSuccess extends CourseState {
  final List<CourseData> courseList;

  GetCoursesSuccess({required this.courseList});
}

final class GetCoursesError extends CourseState {
  final String? errorMessage;

  GetCoursesError({this.errorMessage});
}

/// get course detail
final class GetCourseDetailLoading extends CourseState {}

final class GetCourseDetailSuccess extends CourseState {
  final CourseData course;
  GetCourseDetailSuccess({required this.course});
}

final class GetCourseDetailError extends CourseState {
  final String? errorMessage;
  GetCourseDetailError({this.errorMessage});
}
