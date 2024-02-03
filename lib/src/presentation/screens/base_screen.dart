import 'package:e_learning/src/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/values/colors.dart';
import '../bloc/base/base_cubit.dart';
import 'profile_screen.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({super.key});

  final List<Widget> screenBody = [
    const HomeScreen(),
    const ProfileScreen(),
  ];

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
        child: BlocBuilder<BaseCubit, BaseState>(
          builder: (context, state) {
            return NavigationBar(
              onDestinationSelected: context.read<BaseCubit>().changeFeature,
              indicatorColor: Colors.white30,
              selectedIndex: state.featureIndex,
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
              height: 70,
              elevation: 0,
            );
          },
        ),
      ),
      body: BlocBuilder<BaseCubit, BaseState>(
        builder: (context, state) {
          return screenBody[state.featureIndex];
        },
      ),
    );
  }
}
