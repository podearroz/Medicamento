import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_medicamento/core/essentials/ui/colors/color_pallete.dart';

class MedicamentoAppBarStyles {
  static themeWith(ColorPallete pallete) => AppBarTheme(
        color: pallete.appBar,
        elevation: 0,
        iconTheme: IconThemeData(color: pallete.appBar),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarColor: pallete.statusBarColor,
        ),
      );
}
