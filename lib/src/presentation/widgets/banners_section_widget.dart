import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/banner/banner_cubit.dart';
import 'home_banner_list.dart';

class BannersSectionWidget extends StatelessWidget {
  const BannersSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerCubit, BannerState>(
      buildWhen: (previous, current) =>
          (previous is GetBannerLoading) && (current is GetBannerSuccess) ||
          (previous is GetBannerLoading) && (current is GetBannerError),
      builder: (context, state) {
        if (state is GetBannerSuccess) {
          return HomeBannerList(
            banners: state.bannerList,
          );
        } else if (state is GetBannerError) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
