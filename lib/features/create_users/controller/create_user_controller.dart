import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_medicamento/features/create_users/domain/entity/user_entity.dart';

class CreateUserController {
  final FirebaseAuth firebaseAuth;

  CreateUserController(this.firebaseAuth);

  Future<void> createUser(UserEntity user) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
    } catch (e) {
      print(e);
    }
  }
}
