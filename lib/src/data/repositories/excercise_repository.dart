import 'package:dio/dio.dart';
import 'package:e_learning/src/data/network/http_config.dart';
import 'package:e_learning/src/domain/entities/excercise_model.dart';

class ExcerciseRepository {
  Future<List<ExcerciseData>?> getExcercises({
    required String courseId,
    required String userEmail,
  }) async {
    try {
      final response = await HttpConfig.dioConfig().get(
        'exercise/data_exercise',
        queryParameters: {
          'course_id': courseId,
          'user_email': userEmail,
        },
      );

      // 200 == success
      if (response.statusCode == 200) {
        return ExcerciseResponse.fromJson(response.data).data;
      }

      return null;
    } on DioException {
      return null;
    } catch (e) {
      return null;
    }
  }
}
