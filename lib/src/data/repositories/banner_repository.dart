import 'package:dio/dio.dart';
import 'package:e_learning/src/data/network/http_config.dart';
import 'package:e_learning/src/domain/entities/banner_model.dart';

class BannerRepository {
  Future<List<BannerData>?> getBanners({required String limitBanner}) async {
    try {
      final response = await HttpConfig.dioConfig().get(
        'event/list',
        queryParameters: {
          'limit': limitBanner,
        },
      );

      // 200 == success
      if (response.statusCode == 200) {
        return BannerResponse.fromJson(response.data).data;
      }

      return null;
    } on DioException {
      return null;
    } catch (e) {
      return null;
    }
  }
}
