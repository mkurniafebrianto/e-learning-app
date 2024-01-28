import 'package:dio/dio.dart';
import 'package:e_learning/data/model/course/banner_model.dart';

class BannerRepository {
  Future<BannerResponse> getBanners() async {
    try {
      final response = await Dio().get(
        'https://edspert.widyaedu.com/event/list',
        options: Options(
          headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
        ),
        queryParameters: {
          'limit': '5',
        },
      );

      if (response.statusCode == 200) {
        return BannerResponse.fromJson(response.data);
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
