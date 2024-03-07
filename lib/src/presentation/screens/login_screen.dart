import 'package:e_learning/src/core/values/colors.dart';
import 'package:e_learning/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:e_learning/src/presentation/screens/base_screen.dart';
import 'package:e_learning/src/presentation/screens/registration_screen.dart';
import 'package:e_learning/src/presentation/widgets/login_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../widgets/login_widgets_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) =>
          (previous is SignInWithGoogleLoading) &&
              (current is SignInWithGoogleSuccess) ||
          (previous is SignInWithGoogleLoading) &&
              (current is SignInWithGoogleError) ||
          (previous is GetUserLoading) && (current is GetUserSuccess) ||
          (previous is GetUserLoading) && (current is GetUserError),
      listener: (context, state) {
        if (state is SignInWithGoogleSuccess) {
          Fluttertoast.showToast(
            msg: "Signed in using ${state.email}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
          );
        }

        if (state is SignInWithGoogleError) {
          Fluttertoast.showToast(
            msg: "Failed to sign in with Google",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
          );
        }

        if (state is GetUserSuccess) {
          if (state.userData.iduser == "0") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const RegistrationScreen(),
              ),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const BaseScreen(),
              ),
            );
          }
        }

        if (state is GetUserError) {
          Fluttertoast.showToast(
            msg: "You're not registered",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          centerTitle: false,
          title: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Login',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const LoginWidgetsBody(),
            LoginButtons(
              onGoogleSignInPressed: () => _onGoogleSignInPressed(context),
              onAppleSignInPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

void _onGoogleSignInPressed(BuildContext context) async {
  final authBloc = context.read<AuthBloc>();

  // Initiate sign-in process
  authBloc.add(SignInWithGoogleEvent());

  // Wait for sign-in to complete
  await for (final state in authBloc.stream) {
    if (state is SignInWithGoogleSuccess) {
      // Sign-in successful, proceed with GetUserEvent
      authBloc.add(
          GetUserEvent(email: FirebaseAuth.instance.currentUser?.email ?? ''));
      break; // Exit the for loop
    } else if (state is SignInWithGoogleError) {
      // Handle any errors during sign-in
      debugPrint('Auth error: ${state.errorMessage}');
      // Display error message to user or handle appropriately
      break; // Exit the for loop
    }
  }
}
