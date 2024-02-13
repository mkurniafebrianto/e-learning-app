import 'package:flutter/material.dart';

import '../../core/styles.dart';
import '../screens/login_screen.dart';

class LogoutButtonWidget extends StatelessWidget {
  const LogoutButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49,
      width: 350,
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
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ));
        },
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
    );
  }
}
