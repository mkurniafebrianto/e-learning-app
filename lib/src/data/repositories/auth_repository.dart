import 'dart:typed_data';

import 'package:e_learning/src/data/firebase/firebase_service.dart';
import 'package:e_learning/src/data/network/http_config.dart';
import 'package:e_learning/src/domain/entities/registration_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseService firebaseService;

  AuthRepository({required this.firebaseService});

  Future<User?> signInWithGoogle() async {
    return await firebaseService.signInWithGoogle();
  }

  Future<bool> registrationUser(RegistrationModel registrationModel) async {
    final response = await HttpConfig.dioConfig().post(
      'users/registrasi',
      data: registrationModel.toMap(),
    );

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  Future<String?> uploadFile(
      {required String fileName, required Uint8List fileByte}) async {
    return await firebaseService.uploadFile(
        fileName: fileName, fileByte: fileByte);
  }
}
