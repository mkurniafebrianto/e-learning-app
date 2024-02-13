import 'package:flutter/material.dart';

class NoExcerciseSectionWidget extends StatelessWidget {
  const NoExcerciseSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            child: Align(
              alignment: Alignment.topLeft,
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
        ),
        Expanded(
          flex: 0,
          child: SizedBox(
            width: 269,
            height: 200,
            child: Image.asset(
              'assets/images/no-excercise-logo.png',
            ),
          ),
        ),
        const Expanded(
          flex: 1,
          child: Column(
            children: [
              Text(
                'Yah, Paket tidak tersedia',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Tenang, masih banyak yang bisa kamu pelajari.\n'
                'cari lagi yuk!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11.5,
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
