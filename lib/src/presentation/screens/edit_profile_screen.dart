import 'package:e_learning/src/core/values/colors.dart';
import 'package:flutter/material.dart';

import '../../core/styles.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final list = ['Laki-laki', 'Perempuan'];
  String selectedValue = 'Laki-laki';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Akun',
          style: Styles.textStyle(
            textFont: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.primary,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Data Diri',
                style: Styles.textStyle(
                  textFont: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'Nama lengkap',
                style: Styles.textStyle(
                  textFont: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0x63000000),
                ),
              ),
              TextField(
                enabled: false,
                controller: TextEditingController(text: 'Muhammad Ali Topan'),
              ),
              Text(
                'Email',
                style: Styles.textStyle(
                  textFont: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0x63000000),
                ),
              ),
              TextField(
                controller: TextEditingController(text: 'helloaltop@gmail.com'),
              ),
              Text(
                'Jenis kelamin',
                style: Styles.textStyle(
                  textFont: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0x63000000),
                ),
              ),
              DropdownButton(
                value: selectedValue,
                items: const [
                  DropdownMenuItem(
                    value: 'Laki-laki',
                    child: Text('Laki-laki'),
                  ),
                  DropdownMenuItem(
                    value: 'Perempuan',
                    child: Text('Perempuan'),
                  ),
                ],
                onChanged: (value) => setState(() {
                  selectedValue = value!;
                }),
                isExpanded: true,
                underline: Container(
                  height: 0.5,
                  color: Colors.black,
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
              TextField(
                controller: TextEditingController(),
              ),
              Text(
                'Sekolah',
                style: Styles.textStyle(
                  textFont: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0x63000000),
                ),
              ),
              TextField(
                controller: TextEditingController(),
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(AppColors.primary),
                  ),
                  child: const Text(
                    'Perbarui Data',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
