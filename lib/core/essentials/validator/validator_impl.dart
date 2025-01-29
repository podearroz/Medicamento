import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_medicamento/core/essentials/helper/app_localization_helper.dart';
import 'package:flutter_application_medicamento/core/essentials/validator/validator.dart';

class ValidatorImpl implements Validator {
  late BuildContext _context;
  LocalizationHelper localizationHelper = LocalizationHelper();
  set context(value) {
    _context = value;
  }

  ValidatorImpl();

  @override
  String? validateEmail(String? text) {
    var validate = validateRequired(text);
    if (validate != null) return validate;

    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (text == null || !regex.hasMatch(text)) {
      return localizationHelper.getString("login_invalid_email_error",
          defaultValue: "Invalid e-mail");
    } else {
      return null;
    }
  }

  @override
  String? validatePassword(String? text) {
    var validate = validateRequired(text);
    if (validate != null) return validate;

    if (text!.length < 6) {
      return localizationHelper.getString("login_invalid_password_error",
          defaultValue: "Password must have at least 6 characters");
    } else {
      return null;
    }
  }

  @override
  String? validateRequired(String? text) {
    if (text != null && text.isNotEmpty) {
      return null;
    }
    if (kIsWeb) {
      return "Campo obrigatório";
    }

    return localizationHelper.getString("validation_required",
        defaultValue: "Field required");
  }
}
