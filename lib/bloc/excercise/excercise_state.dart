part of 'excercise_cubit.dart';

@immutable
sealed class ExcerciseState {}

final class ExcerciseInitial extends ExcerciseState {}

final class ExcerciseLoading extends ExcerciseState {}

final class ExcerciseSuccess extends ExcerciseState {
  final List<ExcerciseData> excerciseList;

  ExcerciseSuccess({required this.excerciseList});
}

final class ExcerciseError extends ExcerciseState {
  final String? errorMessage;

  ExcerciseError({required this.errorMessage});
}
