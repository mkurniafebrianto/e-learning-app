import 'package:e_learning/src/core/values/colors.dart';
import 'package:flutter/material.dart';

class SignInLoginButton extends StatelessWidget {
  final bool isGoogleSignIn;
  final VoidCallback onPressed;

  const SignInLoginButton({
    super.key,
    required this.isGoogleSignIn,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          isGoogleSignIn ? Colors.white : Colors.black,
        ),
        elevation: const MaterialStatePropertyAll(2),
        surfaceTintColor: isGoogleSignIn
            ? const MaterialStatePropertyAll(AppColors.background)
            : const MaterialStatePropertyAll(Colors.black),
      ),
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
