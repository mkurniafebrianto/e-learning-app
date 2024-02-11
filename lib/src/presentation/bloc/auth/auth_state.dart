part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

// sign in state
final class SignInWithGoogleLoading extends AuthState {}

final class SignInWithGoogleSuccess extends AuthState {
  final String email;

  SignInWithGoogleSuccess({required this.email});
}

final class SignInWithGoogleError extends AuthState {
  final String errorMessage;

  SignInWithGoogleError({required this.errorMessage});
}

// register user
final class RegistrationLoading extends AuthState {}

final class RegistrationSuccess extends AuthState {}

final class RegistrationError extends AuthState {
  final String errorMessage;

  RegistrationError({required this.errorMessage});
}

// upload file
final class UploadFilePicLoading extends AuthState {}

final class UploadFilePicSuccess extends AuthState {
  final String downloadUrl;

  UploadFilePicSuccess({required this.downloadUrl});
}

final class UploadFilePicError extends AuthState {
  final String errorMessage;

  UploadFilePicError({required this.errorMessage});
}
