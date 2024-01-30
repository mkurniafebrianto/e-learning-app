import 'package:e_learning/core/values/colors.dart';
import 'package:e_learning/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SignInLoginButton extends StatelessWidget {
  final bool isGoogleSignIn;

  const SignInLoginButton({super.key, required this.isGoogleSignIn});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          isGoogleSignIn ? Colors.white : Colors.black,
        ),
        elevation: const MaterialStatePropertyAll(2),
        surfaceTintColor: isGoogleSignIn
            ? const MaterialStatePropertyAll(AppColors.background)
            : const MaterialStatePropertyAll(Colors.black),
      ),
      onPressed: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(isGoogleSignIn
              ? 'assets/icons/google-logo.png'
              : 'assets/icons/apple-logo.png'),
          const SizedBox(width: 8),
          Text(
            'Masuk dengan ${isGoogleSignIn ? 'Google' : 'Apple ID'}',
            style: TextStyle(
              color: isGoogleSignIn ? Colors.black : Colors.white,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
