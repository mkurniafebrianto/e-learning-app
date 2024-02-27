import 'dart:io';

import 'package:e_learning/src/core/values/colors.dart';
import 'package:e_learning/src/domain/entities/registration_model.dart';
import 'package:e_learning/src/domain/usecases/upload_file_usecase.dart';
import 'package:e_learning/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:e_learning/src/presentation/screens/base_screen.dart';
import 'package:e_learning/src/presentation/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

const List<String> listClass = [
  '10',
  '11',
  '12',
];

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String dropdownValue = listClass.first;

  final TextEditingController namaLengkapController = TextEditingController();
  final TextEditingController namaSekolahController = TextEditingController();

  XFile? _selectedImage;
  String? _uploadedImageUrl;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) =>
          (previous is UploadFilePicLoading &&
              current is UploadFilePicSuccess) ||
          (previous is RegistrationLoading && current is RegistrationSuccess),
      listener: (context, state) {
        if (state is UploadFilePicSuccess) {
          debugPrint('File uploaded to ${state.downloadUrl}');
          _callRegisterEvent();
        }

        if (state is RegistrationSuccess) {
          debugPrint('Register success!');
          Fluttertoast.showToast(
            msg: "Registration success",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
          );
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const BaseScreen(),
              ));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Yuk isi data diri',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: false,
          toolbarHeight: 75,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          leading: IconButton(
              onPressed: () =>
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  )),
              icon: const Icon(Icons.arrow_back_sharp)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 16),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: _uploadedImageUrl == null && _selectedImage == null
                          ? Container(
                              width: 120,
                              height: 120,
                              color: Colors.grey,
                            )
                          : _uploadedImageUrl != null
                              ? Image.network(
                                  _uploadedImageUrl!,
                                  height: 120,
                                  width: 120,
                                )
                              : Image.file(
                                  File(_selectedImage!.path),
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        padding: const EdgeInsets.all(4),
                        child: InkWell(
                          onTap: () async {
                            XFile? file = await ImagePicker().pickImage(
                                source: ImageSource.camera, imageQuality: 60);

                            setState(() {
                              _selectedImage = file;
                            });
                          },
                          child: const Icon(Icons.edit_outlined),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                // email,
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Email',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Masukkan email',
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFD6D6D6))),
                  ),
                  controller: TextEditingController(
                      text: FirebaseAuth.instance.currentUser?.email),
                  readOnly: true,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                // nama lengkap,
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Nama lengkap',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukkan nama lengkap',
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFD6D6D6))),
                  ),
                  controller: namaLengkapController,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                //jenis kelamin,
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Jenis kelamin',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          side: const MaterialStatePropertyAll(
                              BorderSide(color: Color(0xFFD6D6D6))),
                        ),
                        child: const Text(
                          'Laki-Laki',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 1,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          side: const MaterialStatePropertyAll(
                              BorderSide(color: Color(0xFFD6D6D6))),
                        ),
                        child: const Text(
                          'Perempuan',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // kelas,
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Kelas',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                DropdownMenu(
                  inputDecorationTheme: const InputDecorationTheme(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFD6D6D6)),
                    ),
                  ),
                  menuStyle: const MenuStyle(
                    surfaceTintColor: MaterialStatePropertyAll(Colors.white),
                  ),
                  expandedInsets: const EdgeInsets.all(0),
                  hintText: 'Pilih kelas',
                  onSelected: (value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  dropdownMenuEntries:
                      listClass.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry(value: value, label: value);
                  }).toList(),
                  textStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                // nama sekolah,
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Nama sekolah',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber)),
                    hintText: 'Masukkan nama sekolah',
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFD6D6D6))),
                  ),
                  controller: namaSekolahController,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 32),
                // button daftar,
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: FilledButton(
                    onPressed: () async {
                      if (_selectedImage != null) {
                        /// get .jpg extension
                        final String fileExt =
                            _selectedImage!.path.split('.').last;

                        /// give file's name using unix
                        final String fileName =
                            '${DateTime.now().millisecondsSinceEpoch}.$fileExt';

                        /// upload profile picture
                        context.read<AuthBloc>().add(UploadProfilePictureEvent(
                              params: UploadFileParams(
                                fileName: fileName,
                                fileByte: await _selectedImage!.readAsBytes(),
                              ),
                            ));
                      } else {
                        _callRegisterEvent();
                      }
                    },
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(AppColors.primary)),
                    child: const Text(
                      'DAFTAR',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _callRegisterEvent([String? profilePicUrl]) {
    context.read<AuthBloc>().add(RegisterUserEvent(
        data: RegistrationModel(
            namaLengkap: namaLengkapController.text,
            email: FirebaseAuth.instance.currentUser!.email!,
            namaSekolah: namaSekolahController.text,
            kelas: '11',
            gender: 'Laki-Laki',
            foto: profilePicUrl,
            jenjang: 'SMA')));
  }
}
