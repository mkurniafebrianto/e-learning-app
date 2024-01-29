import 'package:bloc/bloc.dart';
import 'package:e_learning/data/model/course/banner_model.dart';
import 'package:e_learning/data/repository/banner_repository.dart';
import 'package:meta/meta.dart';

part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit() : super(BannerInitial());

  void getBanners() async {
    emit(BannerLoading());

    final bannerRepository = BannerRepository();

    final response = await bannerRepository.getBanners();

    emit(BannerSuccess(bannerList: response.data ?? []));
  }
}
