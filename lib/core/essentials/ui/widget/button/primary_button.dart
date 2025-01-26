import 'package:flutter/material.dart';
import 'package:flutter_application_medicamento/core/essentials/ui/widget/text/medicamento_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final Widget? child;
  final String? text;
  final ThemeData? theme;
  final Color? buttonColor;
  final double height;
  final double? width;
  final BorderSide? border;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;

  const PrimaryButton({
    Key? key,
    required this.onPressed,
    this.onLongPress,
    this.child,
    this.theme,
    this.text,
    this.buttonColor,
    this.height = 54.0,
    this.width,
    this.border,
    this.textStyle,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonTextStyle = textStyle ?? MedicamentoTextStyles.button(theme);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor ?? theme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: border ?? BorderSide.none,
        ),
        padding: padding ?? const EdgeInsets.all(0),
      ),
      onPressed: onPressed,
      onLongPress: onLongPress,
      child: Container(
        height: height,
        width: width,
        child: Center(
          child: child ?? Text(text ?? "", style: buttonTextStyle),
        ),
      ),
    );
  }
}
