part of 'course_bloc.dart';

@immutable
sealed class CourseState {}

final class CourseInitial extends CourseState {}

final class CourseLoding extends CourseState {}

final class CourseSuccess extends CourseState {
  final List<CourseData> courseList;

  CourseSuccess({required this.courseList});
}

final class CourseError extends CourseState {
  final String? errorMessage;

  CourseError({required this.errorMessage});
}
