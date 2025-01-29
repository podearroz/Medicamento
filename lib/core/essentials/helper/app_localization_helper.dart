import 'package:flutter_application_medicamento/core/essentials/app_localization.dart';

class LocalizationHelper {
  static final LocalizationHelper _instance = LocalizationHelper._internal();

  factory LocalizationHelper() {
    return _instance;
  }

  LocalizationHelper._internal();

  late AppLocalization _localization;

  void init(AppLocalization localization) {
    _localization = localization;
  }

  String getString(String key, {String defaultValue = ''}) {
    return _localization.translate(key) ?? defaultValue;
  }
}
