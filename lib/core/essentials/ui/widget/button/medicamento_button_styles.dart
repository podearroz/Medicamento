import 'package:flutter/material.dart';
import 'package:flutter_application_medicamento/core/essentials/ui/colors/color_pallete.dart';

class MedicamentoButtonStyles {
  static themeWith(ColorPallete pallete) => ButtonThemeData(
      buttonColor: pallete.button,
      textTheme: ButtonTextTheme.normal,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      height: 48);
}
