import 'package:e_learning/src/core/values/colors.dart';
import 'package:e_learning/src/presentation/widgets/login_button.dart';
import 'package:flutter/material.dart';

import '../widgets/login_widgets_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          LoginWidgetsBody(),
          LoginButtons(),
        ],
      ),
    );
  }
}
