import 'package:e_learning/src/data/firebase/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseService firebaseService;

  AuthRepository({required this.firebaseService});

  Future<User?> signInWithGoogle() async {
    return firebaseService.signInWithGoogle();
  }
}
