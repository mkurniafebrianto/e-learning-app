import 'package:e_learning/src/presentation/screens/base_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yuk isi data diri'),
        centerTitle: false,
        toolbarHeight: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // email
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Masukkan email',
                  label: Text('Email'),
                ),
                controller: TextEditingController(
                    text: FirebaseAuth.instance.currentUser?.email),
                enabled: false,
              ),
              const SizedBox(height: 16),
              // nama lengkap
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Masukkan nama lengkap',
                  label: Text('Nama Lengkap'),
                ),
                controller: namaLengkapController,
              ),
              const SizedBox(height: 16),
              //jenis kelamin
              const Text('Jenis kelamin'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    )),
                    child: const Text('Laki Laki'),
                  ),
                  const SizedBox(width: 10),
                  OutlinedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    )),
                    child: const Text('Perempuan'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // kelas,
              DropdownMenu(
                initialSelection: listClass.first,
                onSelected: (value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                dropdownMenuEntries:
                    listClass.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry(value: value, label: value);
                }).toList(),
              ),
              const SizedBox(height: 16),
              // nama sekolah
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Masukkan nama sekolah',
                  label: Text('Nama Sekolah'),
                ),
                controller: namaSekolahController,
              ),
              const SizedBox(height: 16),
              // button daftar,
              FilledButton(
                onPressed: () {
                  String namaLengkap = namaLengkapController.text;
                  String namaSekolah = namaSekolahController.text;

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BaseScreen(),
                      ));
                },
                child: const Text('Daftar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
