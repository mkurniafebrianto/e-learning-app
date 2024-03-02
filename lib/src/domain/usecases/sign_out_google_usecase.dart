import '../../data/repositories/auth_repository.dart';
import 'usecase.dart';

class SignOutGoogleUseCase implements UseCase<bool, void> {
  final AuthRepository authRepository;

  SignOutGoogleUseCase(this.authRepository);

  @override
  Future<bool> call(void params) {
    return authRepository.signOutFromGoogle();
  }
}
