part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SignInWithGoogleLoading extends AuthState {}

final class SignInWithGoogleSuccess extends AuthState {
  final String email;

  SignInWithGoogleSuccess({required this.email});
}

final class SignInWithGoogleError extends AuthState {
  final String errorMessage;

  SignInWithGoogleError({required this.errorMessage});
}
