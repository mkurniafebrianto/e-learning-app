import 'package:e_learning/src/core/values/colors.dart';
import 'package:e_learning/src/core/values/images.dart';
import 'package:e_learning/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:e_learning/src/presentation/screens/base_screen.dart';
import 'package:e_learning/src/presentation/screens/login_screen.dart';
import 'package:e_learning/src/presentation/screens/registration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      // check is user signed in w google
      if (FirebaseAuth.instance.currentUser?.uid != null) {
        // check is user registered
        if (checkUserRegis()) {
          // if user already registered
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const BaseScreen(),
              ));
        } else {
          // if not
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const RegistrationScreen(),
              ));
        }
      } else {
        // if user not signed in yet, navigate to login screen
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ));
      }
    });
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

  bool checkUserRegis() {
    String? email = FirebaseAuth.instance.currentUser?.email;

    if (email != null) {
      context.read<AuthBloc>().add(GetUserEvent(email: email));
      return true;
    } else {
      return false;
    }
  }
}
