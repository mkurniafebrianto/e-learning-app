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

// sign out state
final class SignOutFromGoogleLoading extends AuthState {}

final class SignOutFromGoogleSuccess extends AuthState {
  final bool signOutStatus;

  SignOutFromGoogleSuccess({required this.signOutStatus});
}

final class SignOutFromGoogleError extends AuthState {
  final String errorMessage;

  SignOutFromGoogleError({required this.errorMessage});
}

// register user
final class RegistrationLoading extends AuthState {}

final class RegistrationSuccess extends AuthState {}

final class RegistrationError extends AuthState {
  final String errorMessage;

  RegistrationError({required this.errorMessage});
}

// get user
final class GetUserLoading extends AuthState {}

final class GetUserSuccess extends AuthState {
  final UserData? userData;

  GetUserSuccess({required this.userData});
}

final class GetUserError extends AuthState {
  final String errorMessage;

  GetUserError({required this.errorMessage});
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

// // check user registered or not
// final class CheckUserRegisteredLoading extends AuthState {}

// final class CheckUserRegisteredSuccess extends AuthState {
//   final UserData userData;

//   CheckUserRegisteredSuccess({required this.userData});
// }

// final class CheckUserRegisteredError extends AuthState {
//   final String errorMessage;

//   CheckUserRegisteredError({required this.errorMessage});
// }
