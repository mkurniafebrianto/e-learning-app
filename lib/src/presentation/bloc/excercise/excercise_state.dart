part of 'excercise_cubit.dart';

@immutable
sealed class ExcerciseState {}

final class ExcerciseInitial extends ExcerciseState {}

// get excercises
final class GetExcerciseLoading extends ExcerciseState {}

final class GetExcerciseSuccess extends ExcerciseState {
  final List<ExcerciseData> excerciseList;

  GetExcerciseSuccess({required this.excerciseList});
}

final class GetExcerciseError extends ExcerciseState {
  final String? errorMessage;

  GetExcerciseError({required this.errorMessage});
}
