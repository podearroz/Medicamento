import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_medicamento/core/configs/environment.dart';
import 'package:flutter_application_medicamento/features/create_users/controller/create_user_controller.dart';
import 'package:flutter_application_medicamento/features/login/controller/login_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ApplicationContainer {
  static final ApplicationContainer _instance =
      ApplicationContainer._internal();

  factory ApplicationContainer.instance() {
    return _instance;
  }

  ApplicationContainer._internal();

  final GetIt locator = GetIt.asNewInstance();

  void setUp(Environment env) {
    _setupDependencies(env);
  }

  void _setupDependencies(Environment environment) {
    locator.registerFactory<FirebaseAuth>(() => FirebaseAuth.instance);
    locator.registerFactory<GoogleSignIn>(() => GoogleSignIn());
    locator.registerSingleton<Environment>(environment);
    locator.registerLazySingleton(() => LoginController(resolve(), resolve()));
    locator.registerLazySingleton(() => CreateUserController(resolve()));
  }

  final Map<Type, dynamic> _container = {};

  void register<T>(T instance) {
    _container[T] = instance;
  }

  T resolve<T extends Object>() => locator<T>();

  @override
  FutureOr resetLazySingleton<T extends Object>() {
    locator.resetLazySingleton<T>();
  }
}
