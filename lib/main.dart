import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_medicamento/core/essentials/app_localization.dart';
import 'package:flutter_application_medicamento/core/essentials/ui/app_theme.dart';
import 'package:flutter_application_medicamento/core/navigation/application_route.dart';
import 'package:flutter_application_medicamento/features/create_users/presentation/create_users_page.dart';
import 'package:flutter_application_medicamento/features/login/presentation/login_page.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MedicamentoApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MedicamentoApp extends StatelessWidget {
  //Rotas navegação
  static var routes = {
    ApplicationRoute.login: (BuildContext context) => const LoginPage(),
    ApplicationRoute.createUser: (BuildContext context) =>
        const CreateUserPage(),
  };
  const MedicamentoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Medicamentos',
      theme: MedicamentosTheme.light,
      themeMode: ThemeMode.light,
      routes: routes,
      home: const CreateUserPage(),
      localizationsDelegates: const [
        AppLocalization.delegate,
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('pt', 'BR'),
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        final result = supportedLocales.firstWhere(
            (element) =>
                (element.countryCode == locale!.countryCode &&
                    element.languageCode == locale.languageCode) ||
                (locale.countryCode == null &&
                    element.languageCode == locale.languageCode),
            orElse: () => supportedLocales.first);

        Intl.defaultLocale = '${result.languageCode}_${result.countryCode}';
        return result;
      },
    );
  }
}
