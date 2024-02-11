import 'package:bloc/bloc.dart';
import 'package:e_learning/src/domain/entities/banner_model.dart';
import 'package:e_learning/src/domain/usecases/get_banner_usecase.dart';
import 'package:meta/meta.dart';

part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  final GetBannersUseCase getBannersUseCase;

  BannerCubit(this.getBannersUseCase) : super(BannerInitial());

  Future<void> getBanners() async {
    emit(GetBannerLoading());

    final banners = await getBannersUseCase(
      GetBannersParams(limitBanner: '5'),
    );

    if (banners != null) {
      emit(GetBannerSuccess(bannerList: banners));
    } else {
      emit(GetBannerError(errorMessage: 'Server error'));
    }
  }
}
