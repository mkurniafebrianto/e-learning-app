part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SignInWithGoogleEvent extends AuthEvent {}

class RegisterUserEvent extends AuthEvent {}
