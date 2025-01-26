import 'dart:ui';

abstract class ColorPallete {
  Color get primary;
  Color get secondary;
  Color get tertiary;
  Color get accent;
  Color get background;
  Color get surface;
  Color get shadow;
  Color get separator;
  Color get statusBarColor;
  //User feedback
  Color get error;
  Color get success;
  Color get warning;
  Color get info;
  //Colors
  Color get white;
  Color get black;
  Color get grey;
  //Buttons
  Color get button;
  Color get buttonText;
  Color get buttonLink;
  //Text
  Color get text;
  Color get textLight;
  Color get textAccent;
  Color get textOpaque;
  //Appbar
  Color get appBar;
}
