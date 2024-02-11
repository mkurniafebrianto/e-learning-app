import 'package:e_learning/src/data/repositories/banner_repository.dart';
import 'package:e_learning/src/domain/entities/banner_model.dart';
import 'package:e_learning/src/domain/usecases/usecase.dart';

class GetBannersUseCase
    implements UseCase<List<BannerData>?, GetBannersParams> {
  final BannerRepository bannerRepository;

  GetBannersUseCase(this.bannerRepository);

  @override
  Future<List<BannerData>?> call(params) async {
    return await bannerRepository.getBanners(limitBanner: params.limitBanner);
  }
}

class GetBannersParams {
  final String limitBanner;

  GetBannersParams({required this.limitBanner});
}
