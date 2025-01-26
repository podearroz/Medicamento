import 'dart:ui';

import 'package:flutter_application_medicamento/core/essentials/ui/colors/color_pallete.dart';

class LightPallete implements ColorPallete {
  static final LightPallete _instance = LightPallete._internal();

  Color _primary = const Color(0xFF6200EE);
  Color _secondary = const Color(0xFF03DAC6);

  factory LightPallete({Color? primary, Color? secondary}) {
    _instance._primary = primary ?? _instance._primary;
    _instance._secondary = secondary ?? _instance._secondary;
    return _instance;
  }

  LightPallete._internal();

  @override
  Color get primary => const Color(0xFF6200EE);

  @override
  Color get secondary => const Color(0xFF03DAC6);

  @override
  Color get background => const Color(0xFFFFFFFF);

  @override
  Color get surface => const Color(0xFFFFFFFF);

  @override
  Color get error => const Color(0xFFB00020);

  @override
  Color get success => const Color(0xFF00C853);

  @override
  Color get warning => const Color(0xFFFFAB00);

  @override
  Color get info => const Color(0xFF2979FF);

  @override
  Color get button => const Color(0xFF6200EE);

  @override
  Color get buttonText => const Color(0xFFFFFFFF);

  @override
  Color get buttonLink => const Color(0xFF2979FF);

  @override
  Color get text => const Color(0xFF000000);

  @override
  Color get textLight => const Color(0xFF757575);

  @override
  Color get textAccent => const Color(0xFF6200EE);

  @override
  Color get appBar => const Color(0xFF6200EE);

  @override
  Color get black => const Color(0xFF000000);

  @override
  Color get grey => const Color(0xFF757575);

  @override
  Color get shadow => const Color(0xFF000000);

  @override
  Color get separator => const Color(0xFF757575);

  @override
  Color get tertiary => const Color(0xFFFFFFFF);

  @override
  Color get white => const Color(0xFFFFFFFF);

  @override
  Color get accent => const Color(0xFF03DAC6);

  @override
  Color get statusBarColor => const Color(0xFF6200EE);

  @override
  Color get textOpaque => const Color(0x99000000);
}
