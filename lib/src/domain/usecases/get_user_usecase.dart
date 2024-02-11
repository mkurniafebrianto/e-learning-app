import 'package:e_learning/src/data/repositories/user_repository.dart';
import 'package:e_learning/src/domain/entities/user_model.dart';

import 'usecase.dart';

class GetUserUseCase implements UseCase<UserData?, GetUserParams> {
  final UserRepository userRepository;

  GetUserUseCase(this.userRepository);

  @override
  Future<UserData?> call(params) async {
    return await userRepository.getUser(
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
