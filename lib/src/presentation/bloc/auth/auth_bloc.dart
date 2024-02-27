import 'package:bloc/bloc.dart';
import 'package:e_learning/src/domain/entities/registration_model.dart';
import 'package:e_learning/src/domain/entities/user_model.dart';
import 'package:e_learning/src/domain/usecases/get_user_usecase.dart';
import 'package:e_learning/src/domain/usecases/registration_usecase.dart';
import 'package:e_learning/src/domain/usecases/sign_in_google_usecase.dart';
import 'package:e_learning/src/domain/usecases/sign_out_google_usecase.dart';
import 'package:e_learning/src/domain/usecases/upload_file_usecase.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInGoogleUseCase signInWithGooleUsecase;
  final SignOutGoogleUseCase signOutGoogleUseCase;
  final RegistrationUseCase registrationUseCase;
  final GetUserUseCase getUserUseCase;
  final UploadFileUseCase uploadFileUseCase;

  AuthBloc(
    this.signInWithGooleUsecase,
    this.registrationUseCase,
    this.uploadFileUseCase,
    this.signOutGoogleUseCase,
    this.getUserUseCase,
  ) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is SignInWithGoogleEvent) {
        emit(SignInWithGoogleLoading());

        final user = await signInWithGooleUsecase(null);

        if (user != null) {
          emit(SignInWithGoogleSuccess(email: user.email!));
        } else {
          emit(SignInWithGoogleError(errorMessage: 'Something went wrong.'));
        }
      }

      if (event is SignOutFromGoogleEvent) {
        emit(SignOutFromGoogleLoading());

        try {
          await signOutGoogleUseCase(null);

          emit(SignOutFromGoogleSuccess());
        } catch (e) {
          emit(SignOutFromGoogleError(errorMessage: '$e'));
        }
      }

      if (event is RegisterUserEvent) {
        emit(RegistrationLoading());

        final result = await registrationUseCase(event.data);

        if (result) {
          emit(RegistrationSuccess());
        } else {
          emit(RegistrationError(errorMessage: 'Something went wrong'));
        }
      }

      if (event is GetUserEvent) {
        emit(GetUserLoading());

        final userData = await getUserUseCase(
          GetUserParams(email: event.email),
        );

        if (userData != null) {
          emit(GetUserSuccess(userData: userData));
        } else {
          emit(GetUserError(errorMessage: 'Something went wrong'));
        }
      }

      if (event is UploadProfilePictureEvent) {
        emit(UploadFilePicLoading());

        final downloadUrl = await uploadFileUseCase(event.params);
        if (downloadUrl != null) {
          emit(UploadFilePicSuccess(downloadUrl: downloadUrl));
        } else {
          emit(UploadFilePicError(errorMessage: 'Failed to upload!'));
        }
      }
    });
  }
}
