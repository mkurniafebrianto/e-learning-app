import 'package:bloc/bloc.dart';
import 'package:e_learning/src/domain/entities/registration_model.dart';
import 'package:e_learning/src/domain/usecases/registration_usecase.dart';
import 'package:e_learning/src/domain/usecases/sign_in_google_usecase.dart';
import 'package:e_learning/src/domain/usecases/upload_file_usecase.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInGoogleUseCase signInWithGooleUsecase;
  final RegistrationUseCase registrationUseCase;
  final UploadFileUseCase uploadFileUseCase;

  AuthBloc(
    this.signInWithGooleUsecase,
    this.registrationUseCase,
    this.uploadFileUseCase,
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

      if (event is RegisterUserEvent) {
        emit(RegistrationLoading());

        final result = await registrationUseCase(event.data);

        if (result) {
          emit(RegistrationSuccess());
        } else {
          emit(RegistrationError(errorMessage: 'Something went wrong'));
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
