import 'package:flutter/material.dart';
import 'package:flutter_application_medicamento/core/essentials/ui/colors/color_pallete.dart';
import 'package:flutter_application_medicamento/core/essentials/ui/colors/dark_pallete.dart';
import 'package:flutter_application_medicamento/core/essentials/ui/colors/light_pallete.dart';
import 'package:flutter_application_medicamento/core/essentials/ui/widget/appbar/medicamento_app_bar_styles.dart';
import 'package:flutter_application_medicamento/core/essentials/ui/widget/button/medicamento_button_styles.dart';
import 'package:flutter_application_medicamento/core/essentials/ui/widget/text/medicamento_text_styles.dart';

class MedicamentosTheme {
  static final light = themeWithPallete(Brightness.light, LightPallete());
  static final dark = themeWithPallete(Brightness.dark, LightPallete());

  static ThemeData themeWithPallete(
          Brightness brightness, ColorPallete pallete) =>
      ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: pallete.accent,
            brightness: brightness,
            primary: pallete.primary,
            shadow: pallete.shadow,
            tertiary: pallete.tertiary,
            surface: pallete.surface,
            onSurface: pallete.black,
            outline: pallete.separator,
            secondaryContainer: pallete.primary,
          ),
          dividerTheme: DividerThemeData(
            color: pallete.grey,
            space: 0,
            thickness: 1,
          ),
          checkboxTheme:
              CheckboxThemeData(side: BorderSide(color: pallete.grey)),
          primaryColor: pallete.primary,
          secondaryHeaderColor: pallete.secondary,
          scaffoldBackgroundColor: pallete.background,
          dialogBackgroundColor: pallete.background,
          canvasColor: pallete.background,
          cardColor: pallete.background,
          textTheme: MedicamentoTextStyles.themeWith(pallete),
          appBarTheme: MedicamentoAppBarStyles.themeWith(pallete),
          buttonTheme: MedicamentoButtonStyles.themeWith(pallete),
          dialogTheme: DialogTheme(
            backgroundColor: pallete.background,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(color: pallete.textOpaque),
          ),
          splashColor: pallete.primary.withOpacity(0.2),
          highlightColor: pallete.primary.withOpacity(0.1),
          chipTheme: const ChipThemeData(
            showCheckmark: false,
          ));

  static ColorPallete palleteOf(ThemeData data) =>
      data.brightness == Brightness.light ? LightPallete() : DarkPallete();

  MedicamentosTheme._();
}
