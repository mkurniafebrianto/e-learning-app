import 'package:e_learning/src/core/styles.dart';
import 'package:e_learning/src/core/values/colors.dart';
import 'package:e_learning/src/presentation/screens/edit_profile_screen.dart';
import 'package:e_learning/src/presentation/widgets/logout_button_widget.dart';
import 'package:e_learning/src/presentation/widgets/profile_header_widget.dart';
import 'package:e_learning/src/presentation/widgets/profile_info_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Akun Saya',
          style: Styles.textStyle(
            textFont: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const EditProfileScreen(),
            )),
            child: Text(
              'Edit',
              style: Styles.textStyle(
                textFont: 15,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProfileHeaderWidget(),
            SizedBox(height: 24),
            ProfileInfoWidget(),
            SizedBox(height: 24),
            LogoutButtonWidget(),
          ],
        ),
      ),
    );
  }
}
