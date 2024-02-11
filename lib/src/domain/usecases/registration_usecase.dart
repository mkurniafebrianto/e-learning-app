import 'package:e_learning/src/data/repositories/auth_repository.dart';
import 'package:e_learning/src/domain/usecases/usecase.dart';

import '../entities/registration_model.dart';

class RegistrationUseCase implements UseCase<bool, RegistrationModel> {
  final AuthRepository authRepository;

  RegistrationUseCase(this.authRepository);

  @override
  Future<bool> call(params) async {
    return await authRepository.registrationUser(params);
  }
}
