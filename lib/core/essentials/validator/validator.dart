import 'package:flutter/material.dart';

abstract class Validator {
  set context(BuildContext context);
  String? validateEmail(String? text);
  String? validatePassword(String? text);
  String? validateRequired(String? text);
}
