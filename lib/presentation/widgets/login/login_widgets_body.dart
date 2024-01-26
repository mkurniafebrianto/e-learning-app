import 'package:e_learning/core/values/colors.dart';
import 'package:flutter/material.dart';

class LoginWidgetsBody extends StatelessWidget {
  const LoginWidgetsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/login.png',
          width: MediaQuery.of(context).size.width,
        ),
        const Text(
          'Selamat Datang',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 22,
          ),
        ),
        const Text(
          'Selamat Datang di Aplikasi Widya Edu\n'
          'Aplikasi Latihan dan Konsultasi Soal',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: FontColors.secondary,
          ),
        ),
      ],
    );
  }
}
