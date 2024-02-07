part of 'banner_cubit.dart';

@immutable
sealed class BannerState {}

final class BannerInitial extends BannerState {}

final class GetBannerLoading extends BannerState {}

final class GetBannerSuccess extends BannerState {
  final List<BannerData> bannerList;

  GetBannerSuccess({required this.bannerList});
}

final class GetBannerError extends BannerState {
  final String errorMessage;

  GetBannerError({required this.errorMessage});
}
