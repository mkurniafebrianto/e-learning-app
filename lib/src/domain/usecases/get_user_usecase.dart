import 'package:e_learning/src/data/repositories/auth_repository.dart';
import 'package:e_learning/src/domain/entities/user_model.dart';

import 'usecase.dart';

class GetUserUseCase implements UseCase<UserData?, GetUserParams> {
  final AuthRepository authRepository;

  GetUserUseCase(this.authRepository);

  @override
  Future<UserData?> call(params) async {
    return await authRepository.getUserByEmail(
      userEmail: params.email,
    );
  }
}

class GetUserParams {
  final String email;

  GetUserParams({
    required this.email,
  });
}
