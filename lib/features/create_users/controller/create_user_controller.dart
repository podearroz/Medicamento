import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_medicamento/features/create_users/domain/entity/user_entity.dart';

class CreateUserController {
  final FirebaseAuth firebaseAuth;

  CreateUserController(this.firebaseAuth);

  Future<void> createUser(BuildContext context, UserEntity user) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: const Text('Usuário criado com sucesso!')),
      );
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao criar usuário: $e')),
      );
    }
  }
}
