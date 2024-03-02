part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SignInWithGoogleEvent extends AuthEvent {}

class SignOutFromGoogleEvent extends AuthEvent {}

class GetUserEvent extends AuthEvent {
  final String email;

  GetUserEvent({required this.email});
}

class RegisterUserEvent extends AuthEvent {
  final RegistrationModel data;

  RegisterUserEvent({required this.data});
}

class UploadProfilePictureEvent extends AuthEvent {
  final UploadFileParams params;

  UploadProfilePictureEvent({required this.params});
}

class CheckUserRegistered extends AuthEvent {}
