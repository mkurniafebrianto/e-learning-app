import 'package:dio/dio.dart';
import 'package:e_learning/src/data/network/http_config.dart';
import 'package:e_learning/src/domain/entities/user_model.dart';

class UserRepository {
  Future<UserData?> getUser({
    required String userEmail,
  }) async {
    try {
      final response = await HttpConfig.dioConfig().get(
        'users',
        queryParameters: {
          'email': userEmail,
        },
      );

      // 200 == success
      if (response.statusCode == 200) {
        return UserResponse.fromJson(response.data).data;
      }

      return null;
    } on DioException {
      return null;
    } catch (e) {
      return null;
    }
  }
}
