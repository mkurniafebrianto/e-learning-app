import 'package:e_learning/bloc/banner/banner_cubit.dart';
import 'package:e_learning/bloc/course/course_bloc.dart';
import 'package:e_learning/core/values/colors.dart';
import 'package:e_learning/presentation/widgets/home/home_banner.dart';
import 'package:e_learning/presentation/widgets/home/home_banner_list.dart';
import 'package:e_learning/presentation/widgets/home/home_course_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CourseBloc()..add(GetCourseEvent()),
        ),
        BlocProvider(
          create: (context) => BannerCubit()..getBanners(),
        ),
      ],
      child: Scaffold(
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
                backgroundImage: AssetImage('assets/images/edo selfie.png'),
                radius: 20,
              )
            ],
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          shape: const CircleBorder(),
          backgroundColor: AppColors.primary,
          child: const Icon(
            Icons.check_circle_outline,
            color: Colors.white,
            size: 32,
          ),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            indicatorColor: Colors.amber,
            selectedIndex: currentPageIndex,
            destinations: [
              NavigationDestination(
                icon: Image.asset(
                  'assets/images/home-icon.png',
                ),
                label: 'Home',
              ),
              const NavigationDestination(
                icon: Icon(Icons.person_2_rounded),
                label: 'Profile',
              ),
            ],
            backgroundColor: Colors.white,
            height: 75,
            elevation: 0,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const HomeBanner(),
                  const SizedBox(height: 3),
                  Column(
                    children: [
                      BlocBuilder<CourseBloc, CourseState>(
                        builder: (context, state) {
                          if (state is CourseSuccess) {
                            return HomeCourseList(
                              courses: state.courseList,
                            );
                          } else if (state is CourseError) {
                            return Center(
                              child: Text(
                                  state.errorMessage ?? 'Something went wrong'),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 15),
                      BlocBuilder<BannerCubit, BannerState>(
                        builder: (context, state) {
                          if (state is BannerSuccess) {
                            return HomeBannerList(
                              banners: state.bannerList,
                            );
                          } else if (state is BannerError) {
                            return Center(
                              child: Text(
                                  state.errorMessage ?? 'Something went wrong'),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
