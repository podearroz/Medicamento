import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class AppLocalization {
  final Locale locale;
  late Map<String, String> _localizedStrings;

  AppLocalization(this.locale);

  static const LocalizationsDelegate<AppLocalization> delegate =
      _AppLocalizationDelegate();

  static AppLocalization of(BuildContext context) {
    return Localizations.of(context, AppLocalization);
  }

  Future load() async {
    String packageLanguage =
        "lang/${locale.languageCode}_${locale.countryCode}.json";
    if (locale.languageCode == 'en' && locale.countryCode == 'BR') {
      packageLanguage = "lang/en.json";
    }
    String fileContent = await rootBundle.loadString(packageLanguage);
    Map<String, dynamic> jsonMap = json.decode(fileContent);
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  String? translate(String key) {
    return _localizedStrings[key];
  }

  String getString(BuildContext? context, String key,
      {String defaultValue = ''}) {
    if (kIsWeb) {
      return defaultValue;
    } else {
      return context != null
          ? (AppLocalization.of(context).translate(key) ?? defaultValue)
          : defaultValue;
    }
  }
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'pt'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization localization = AppLocalization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(_AppLocalizationDelegate old) => false;
}
