import 'package:e_learning/core/values/colors.dart';
import 'package:e_learning/core/values/images.dart';
import 'package:e_learning/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) =>
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Image.asset(ImageAssets.imageLogo),
      ),
    );
  }
}
