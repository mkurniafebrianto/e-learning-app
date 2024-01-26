import 'package:e_learning/presentation/widgets/login/signin_login_button.dart';
import 'package:flutter/material.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SignInLoginButton(isGoogleSignIn: true),
        SizedBox(height: 20),
        SignInLoginButton(isGoogleSignIn: false),
      ],
    );
  }
}
