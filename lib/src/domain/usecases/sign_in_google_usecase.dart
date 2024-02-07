import 'package:e_learning/src/data/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'usecase.dart';

class SignInGoogleUseCase implements UseCase<User?, void> {
  final AuthRepository authRepository;

  SignInGoogleUseCase(this.authRepository);

  @override
  Future<User?> call(void params) {
    return authRepository.signInWithGoogle();
  }
}
