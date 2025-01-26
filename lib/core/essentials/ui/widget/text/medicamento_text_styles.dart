import 'package:flutter/material.dart';
import 'package:flutter_application_medicamento/core/essentials/ui/app_theme.dart';
import 'package:flutter_application_medicamento/core/essentials/ui/colors/color_pallete.dart';

class MedicamentoTextStyles {
  static themeWith(ColorPallete pallete) => TextTheme(
        displayLarge: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w200,
          color: pallete.text,
          height: 1.2,
        ),
        displayMedium: TextStyle(
          fontSize: 56,
          fontWeight: FontWeight.normal,
          color: pallete.text,
          height: 1.2,
        ),
        displaySmall: TextStyle(
          fontSize: 45,
          fontWeight: FontWeight.normal,
          color: pallete.text,
          height: 1.2,
        ),
        headlineMedium: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.normal,
          color: pallete.text,
          height: 1.2,
        ),
        headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: pallete.text,
          height: 1.3,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: pallete.text,
          height: 1.3,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: pallete.text,
          height: 1.4,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: pallete.text,
          height: 1.4,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: pallete.text,
          height: 1.3,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: pallete.text,
          height: 1.3,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: pallete.text,
          height: 1.3,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: pallete.text,
          height: 1.2,
        ),
        labelSmall: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.normal,
          color: pallete.text,
          height: 1.2,
        ),
      );

  /// Tamanho: 14
  static TextStyle? titleSmall(ThemeData theme) => theme.textTheme.titleSmall;

  /// Tamanho: 14
  static TextStyle? titleSmallBold(ThemeData theme) =>
      theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold);

  /// Tamanho: 16
  static TextStyle? titleMedium(ThemeData theme) => theme.textTheme.titleMedium;

  /// Tamanho: 16
  static TextStyle? titleMediumBold(ThemeData theme) =>
      theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold);

  /// Tamanho: 20
  static TextStyle? titleLarge(ThemeData theme) => theme.textTheme.titleLarge;

  /// Tamanho: 20
  static TextStyle? titleLargeBold(ThemeData theme) =>
      theme.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold);

  /// Tamanho: 12
  static TextStyle? bodySmall(ThemeData theme) => theme.textTheme.bodySmall;

  /// Tamanho: 12
  static TextStyle? bodySmallBold(ThemeData theme) =>
      theme.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold);

  /// Tamanho: 14
  static TextStyle? bodyMedium(ThemeData theme) => theme.textTheme.bodyMedium;

  /// Tamanho: 14
  static TextStyle? bodyMediumBold(ThemeData theme) =>
      theme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold);

  /// Tamanho: 16
  static TextStyle? bodyLarge(ThemeData theme) => theme.textTheme.bodyLarge;

  /// Tamanho: 16
  static TextStyle? bodyLargeBold(ThemeData theme) =>
      theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold);

  /// Tamanho: 16
  static TextStyle? subtitleBold(ThemeData theme) =>
      theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold);

  /// Tamanho: 14
  static TextStyle? button(ThemeData theme) => theme.textTheme.labelLarge;

  /// Tamanho: 14
  static TextStyle? error(ThemeData theme) => theme.textTheme.bodyMedium!
      .copyWith(color: MedicamentosTheme.palleteOf(theme).error);
}
