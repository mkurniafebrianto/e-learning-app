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
