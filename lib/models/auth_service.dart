import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

final authServiceProvider = Provider((ref) => AuthService(
    firebaseAuth: FirebaseAuth.instance, googleSignIn: GoogleSignIn()));

class AuthService {
  FirebaseAuth firebaseAuth;
  GoogleSignIn googleSignIn;

  AuthService({required this.firebaseAuth, required this.googleSignIn});

  // xu ly phuong thuc dang nhap voi google
  signInWithGoogle() async {
    final user = await googleSignIn.signIn();
    final googleAuth = await user!.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    // dang ky nguoi dung vao firebase
    await firebaseAuth.signInWithCredential(credential);
  }
}
