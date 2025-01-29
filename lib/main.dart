import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_medicamento/core/dependency/application_container.dart';
import 'package:flutter_application_medicamento/core/environment/dev_environment.dart';
import 'package:flutter_application_medicamento/core/essentials/app_localization.dart';
import 'package:flutter_application_medicamento/core/essentials/helper/app_localization_helper.dart';
import 'package:flutter_application_medicamento/core/essentials/ui/app_theme.dart';
import 'package:flutter_application_medicamento/core/navigation/application_route.dart';
import 'package:flutter_application_medicamento/features/create_users/presentation/create_users_page.dart';
import 'package:flutter_application_medicamento/features/login/presentation/login_page.dart';
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  ApplicationContainer.instance().setUp(DevEnvironment());

  // Inicializa a localização com idioma padrão (Português - Brasil)
  Locale defaultLocale = const Locale('pt', 'BR');
  AppLocalization localization = AppLocalization(defaultLocale);
  await localization.load();
  LocalizationHelper().init(localization);

  runApp(const MedicamentoApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MedicamentoApp extends StatelessWidget {
  const MedicamentoApp({super.key});

  static final Map<String, WidgetBuilder> routes = {
    ApplicationRoute.login: (BuildContext context) => const LoginPage(),
    ApplicationRoute.createUser: (BuildContext context) => CreateUserPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Medicamentos',
      theme: MedicamentosTheme.light,
      themeMode: ThemeMode.light,
      routes: routes,
      home: const LoginPage(),
      localizationsDelegates: const [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('pt', 'BR'),
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale == null) return supportedLocales.first;

        final result = supportedLocales.firstWhere(
          (element) =>
              element.languageCode == locale.languageCode &&
              (element.countryCode == locale.countryCode ||
                  element.countryCode == null),
          orElse: () => supportedLocales.first,
        );

        Intl.defaultLocale = '${result.languageCode}_${result.countryCode}';
        return result;
      },
    );
  }
}
