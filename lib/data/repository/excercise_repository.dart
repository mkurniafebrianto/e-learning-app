import 'package:dio/dio.dart';
import 'package:e_learning/data/model/course/excercise_model.dart';

class ExcerciseRepository {
  Future<ExcerciseResponse> getExcercises(String courseId) async {
    try {
      final response = await Dio().get(
        'https://edspert.widyaedu.com/exercise/data_exercise',
        options: Options(
          headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
        ),
        queryParameters: {
          'course_id': courseId,
          'user_email': 'testerngbayu@gmail.com'
        },
      );

      if (response.statusCode == 200) {
        return ExcerciseResponse.fromJson(response.data);
      }

      throw Exception('Status code not 200');
    } on DioException catch (e) {
      print('${e.error}: ${e.message}');
      rethrow;
    } catch (e) {
      print('${e.toString()}: Unknown Error');
      rethrow;
    }
  }
}
