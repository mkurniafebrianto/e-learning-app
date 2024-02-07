import 'package:flutter/material.dart';

import 'signin_login_button.dart';

class LoginButtons extends StatelessWidget {
  final VoidCallback onGoogleSignInPressed;
  final VoidCallback onAppleSignInPressed;

  const LoginButtons(
      {super.key,
      required this.onGoogleSignInPressed,
      required this.onAppleSignInPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SignInLoginButton(
          isGoogleSignIn: true,
          onPressed: onGoogleSignInPressed,
        ),
        const SizedBox(height: 20),
        SignInLoginButton(
          isGoogleSignIn: false,
          onPressed: onAppleSignInPressed,
        ),
      ],
    );
  }
}
