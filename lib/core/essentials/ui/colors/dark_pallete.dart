import 'dart:ui';

import 'package:flutter_application_medicamento/core/essentials/ui/colors/color_pallete.dart';

class DarkPallete implements ColorPallete {
  static final DarkPallete _instance = DarkPallete._internal();

  Color _primary = const Color(0xFF6200EE);
  Color _secondary = const Color(0xFF03DAC6);

  factory DarkPallete({Color? primary, Color? secondary}) {
    _instance._primary = primary ?? _instance._primary;
    _instance._secondary = secondary ?? _instance._secondary;
    return _instance;
  }

  DarkPallete._internal();

  @override
  Color get primary => const Color(0xFF6200EE);

  @override
  Color get secondary => const Color(0xFF03DAC6);

  @override
  Color get background => const Color(0xFF121212);

  @override
  Color get surface => const Color(0xFF121212);

  @override
  Color get error => const Color(0xFFCF6679);

  @override
  Color get success => const Color(0xFF66BB6A);

  @override
  Color get warning => const Color(0xFFFFAB00);

  @override
  Color get info => const Color(0xFF64B5F6);

  @override
  Color get button => const Color(0xFF6200EE);

  @override
  Color get buttonText => const Color(0xFFFFFFFF);

  @override
  Color get buttonLink => const Color(0xFF64B5F6);

  @override
  Color get text => const Color(0xFFFFFFFF);

  @override
  Color get textLight => const Color(0xFF757575);

  @override
  Color get textAccent => const Color(0xFF6200EE);

  @override
  Color get appBar => const Color(0xFF121212);

  @override
  Color get black => const Color(0xFF000000);

  @override
  Color get grey => const Color(0xFF757575);

  @override
  Color get separator => const Color(0xFF757575);

  @override
  Color get shadow => const Color(0xFF000000);

  @override
  Color get tertiary => const Color(0xFF121212);

  @override
  Color get accent => const Color(0xFF03DAC6);

  @override
  Color get white => const Color(0xFFFFFFFF);

  @override
  Color get statusBarColor => const Color(0xFF121212);

  @override
  Color get textOpaque => const Color(0x99FFFFFF);
}
