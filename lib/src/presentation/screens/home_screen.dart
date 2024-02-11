import 'package:e_learning/src/core/values/colors.dart';
import 'package:e_learning/src/presentation/bloc/banner/banner_cubit.dart';
import 'package:e_learning/src/presentation/widgets/courses_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/course/course_bloc.dart';
import '../widgets/banners_section_widget.dart';
import '../widgets/home_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // calling something after the UI successfully loaded
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CourseBloc>().add(GetCoursesEvent());
      context.read<BannerCubit>().getBanners();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        surfaceTintColor: AppColors.background,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hai, Edo',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Selamat Datang',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/edo-selfie.png'),
              radius: 20,
            )
          ],
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeBanner(),
              SizedBox(height: 3),
              CoursesSectionWidget(),
              SizedBox(height: 15),
              BannersSectionWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
