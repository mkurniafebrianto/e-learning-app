import 'package:bloc/bloc.dart';
import 'package:e_learning/src/domain/entities/banner_model.dart';
import 'package:meta/meta.dart';

import '../../../data/repositories/banner_repository.dart';

part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit() : super(BannerInitial());

  Future<void> getBanners() async {
    emit(BannerLoading());

    final bannerRepository = BannerRepository();

    final response = await bannerRepository.getBanners();

    emit(BannerSuccess(bannerList: response.data ?? []));
  }
}
