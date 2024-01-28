import 'package:e_learning/core/values/colors.dart';
import 'package:e_learning/data/model/course/banner_model.dart';
import 'package:e_learning/data/model/course/course_model.dart';
import 'package:e_learning/data/repository/banner_repository.dart';
import 'package:e_learning/data/repository/course_repo.dart';
import 'package:e_learning/presentation/widgets/home/home_banner.dart';
import 'package:e_learning/presentation/widgets/home/home_banner_list.dart';
import 'package:e_learning/presentation/widgets/home/home_course_list.dart';
import 'package:flutter/material.dart';

enum ViewState {
  init,
  loading,
  success,
  error,
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final courseRepository = CourseRepository();
  final bannerRespository = BannerRepository();
  CourseResponse? courseResponse;
  BannerResponse? bannerResponse;
  ViewState courseState = ViewState.init;
  ViewState bannerState = ViewState.init;

  @override
  void initState() {
    _getCourse();
    _getBanner();
    super.initState();
  }

  void _getCourse() async {
    courseState = ViewState.loading;
    setState(() {});
    courseResponse = await courseRepository.getCourses();
    print(courseResponse?.message);
    courseState = ViewState.success;
    setState(() {});
  }

  void _getBanner() async {
    bannerState = ViewState.loading;
    setState(() {});
    bannerResponse = await bannerRespository.getBanners();
    print(bannerResponse?.message);
    bannerState = ViewState.success;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
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
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/home-icon.png',
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/profile-icon.png',
              ),
              label: 'Profile',
            ),
          ],
          backgroundColor: Colors.white,
          iconSize: 25,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Center(
          child: Column(
            children: [
              const HomeBanner(),
              const SizedBox(height: 3),
              Expanded(
                child: Column(
                  children: [
                    courseState != ViewState.success
                        ? const Center(child: CircularProgressIndicator())
                        : HomeCourseList(courses: courseResponse?.data ?? []),
                    const SizedBox(height: 15),
                    bannerState != ViewState.success
                        ? const Center(child: CircularProgressIndicator())
                        : HomeBannerList(banners: bannerResponse?.data ?? []),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
