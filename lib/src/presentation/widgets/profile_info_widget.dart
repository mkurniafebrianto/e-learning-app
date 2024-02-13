import 'package:flutter/material.dart';

import '../../core/styles.dart';

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 329,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey, //New
              blurRadius: 7,
              offset: Offset(0, 0))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Identitas Diri',
              style: Styles.textStyle(
                textFont: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Nama lengkap',
              style: Styles.textStyle(
                textFont: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0x63000000),
              ),
            ),
            Text(
              'Muhammad Ali Topan',
              style: Styles.textStyle(
                textFont: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              'Email',
              style: Styles.textStyle(
                textFont: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0x63000000),
              ),
            ),
            Text(
              'helloaltop@gmail.com',
              style: Styles.textStyle(
                textFont: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              'Jenis kelamin',
              style: Styles.textStyle(
                textFont: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0x63000000),
              ),
            ),
            Text(
              'Laki-laki',
              style: Styles.textStyle(
                textFont: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              'Kelas',
              style: Styles.textStyle(
                textFont: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0x63000000),
              ),
            ),
            Text(
              'XII-IPA',
              style: Styles.textStyle(
                textFont: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              'Sekolah',
              style: Styles.textStyle(
                textFont: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0x63000000),
              ),
            ),
            Text(
              'SMAN 1 Kediri',
              style: Styles.textStyle(
                textFont: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
