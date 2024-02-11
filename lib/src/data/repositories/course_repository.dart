import 'package:dio/dio.dart';
import 'package:e_learning/src/data/network/http_config.dart';
import 'package:e_learning/src/domain/entities/course_model.dart';

class CourseRepository {
  Future<List<CourseData>?> getCourses({
    required String majorName,
    required String userEmail,
  }) async {
    try {
      final response = await HttpConfig.dioConfig().get(
        'exercise/data_course',
        queryParameters: {
          'major_name': majorName,
          'user_email': userEmail,
        },
      );

      // 200 == success
      if (response.statusCode == 200) {
        return CourseResponse.fromJson(response.data).data;
      }

      return null;
    } on DioException {
      return null;
    } catch (e) {
      return null;
    }
  }
}
