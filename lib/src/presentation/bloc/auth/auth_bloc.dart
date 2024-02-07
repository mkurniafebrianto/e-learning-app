import 'package:bloc/bloc.dart';
import 'package:e_learning/src/domain/usecases/sign_in_google_usecase.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInGoogleUseCase signInWithGooleUsecase;

  AuthBloc(this.signInWithGooleUsecase) : super(AuthInitial()) {
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
    });
  }
}
