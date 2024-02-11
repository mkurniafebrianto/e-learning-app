import 'package:flutter/material.dart';

class NoExcerciseSectionWidget extends StatelessWidget {
  const NoExcerciseSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Pilih Paket Soal',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/no-excercise-logo.png',
              ),
              const Text(
                'Yah, Paket tidak tersedia',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Tenang, masih banyak yang bisa kamu pelajari.\n'
                'cari lagi yuk!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w100,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
