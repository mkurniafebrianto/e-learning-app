import 'package:dio/dio.dart';
import 'package:e_learning/data/model/course/course_model.dart';

class CourseRepository {
  Future<CourseResponse> getCourses() async {
    try {
      final response = await Dio().get(
        'https://edspert.widyaedu.com/exercise/data_course',
        options: Options(
          headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
        ),
        queryParameters: {
          'major_name': 'IPA',
          'user_email': 'testerngbayu@gmail.com'
        },
      );

      if (response.statusCode == 200) {
        return CourseResponse.fromJson(response.data);
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
