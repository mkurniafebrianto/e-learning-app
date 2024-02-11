import 'package:e_learning/src/core/styles.dart';
import 'package:e_learning/src/core/values/colors.dart';
import 'package:e_learning/src/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Akun Saya',
          style: Styles.textStyle(
            textFont: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Edit',
              style: Styles.textStyle(
                textFont: 15,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 110,
              decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Fajrin Arrahman',
                              style: Styles.textStyle(
                                textFont: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'SMAN 1 Kediri',
                              style: Styles.textStyle(
                                textFont: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Expanded(
                      child: CircleAvatar(
                        radius: 30,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 334,
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
                        textFont: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0x63000000),
                      ),
                    ),
                    Text(
                      'Muhammad Ali Topan',
                      style: Styles.textStyle(
                        textFont: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Email',
                      style: Styles.textStyle(
                        textFont: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0x63000000),
                      ),
                    ),
                    Text(
                      'helloaltop@gmail.com',
                      style: Styles.textStyle(
                        textFont: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Jenis kelamin',
                      style: Styles.textStyle(
                        textFont: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0x63000000),
                      ),
                    ),
                    Text(
                      'Laki-laki',
                      style: Styles.textStyle(
                        textFont: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Kelas',
                      style: Styles.textStyle(
                        textFont: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0x63000000),
                      ),
                    ),
                    Text(
                      'XII-IPA',
                      style: Styles.textStyle(
                        textFont: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Sekolah',
                      style: Styles.textStyle(
                        textFont: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0x63000000),
                      ),
                    ),
                    Text(
                      'SMAN 1 Kediri',
                      style: Styles.textStyle(
                        textFont: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              height: 49,
              width: 333,
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
              child: InkWell(
                onTap: () =>
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Keluar',
                        style: Styles.textStyle(
                          textFont: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
