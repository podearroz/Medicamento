import 'package:flutter/material.dart';
import 'package:flutter_application_medicamento/core/essentials/ui/app_theme.dart';

AppBar PrimaryAppBar(
    {required String title,
    required ThemeData theme,
    List<Widget>? actions,
    bool centerTitle = true,
    Color? iconColor,
    Widget? leading,
    PreferredSizeWidget? tabs,
    Function()? onBack}) {
  return AppBar(
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    surfaceTintColor: Colors.transparent,
    backgroundColor: MedicamentosTheme.palleteOf(theme).appBar,
    centerTitle: centerTitle,
    actions: actions,
    iconTheme: IconThemeData(color: iconColor),
    leading: leading ??
        Builder(builder: (context) {
          if (Navigator.canPop(context)) {
            return IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                if (onBack != null) {
                  onBack();
                } else {
                  Navigator.of(context).pop();
                }
              },
            );
          } else {
            return SizedBox.shrink();
          }
        }),
    bottom: tabs,
  );
}
