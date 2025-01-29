import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_medicamento/core/navigation/application_route.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  LoginController(this.firebaseAuth, this.googleSignIn);

  Future<User?> loginWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<User?> loginWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      final UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      redirectToMedicationRegistration(context);
      return userCredential.user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  void redirectToMedicationRegistration(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content:
            Text('Você será encaminhado para a tela de registro de medicação.'),
      ),
    );

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamed(context, ApplicationRoute.registerMedication);
    });
  }
}
