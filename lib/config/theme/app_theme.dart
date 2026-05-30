import 'package:flutter/material.dart';

import 'style_constants.dart';
import 'app_colors.dart';

class AppTheme {
  static final colorScheme = ColorScheme.dark(
    primary: AppColors.primary,
    surface: AppColors.primaryDarkColor,
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: colorScheme,

    // [panara_dialogs] theme depends on these
    dialogBackgroundColor: AppColors.primaryDarkColor,
    buttonTheme: ButtonThemeData(colorScheme: colorScheme),
    hintColor: Colors.grey,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.secondaryDarkColor,
      scrolledUnderElevation: 0,
    ),
    useMaterial3: true,
    primaryColor: AppColors.primary,
    primaryColorDark: AppColors.primaryDarkColor,
    scaffoldBackgroundColor: AppColors.secondaryDarkColor,
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: StyleConstants.iconSize,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            StyleConstants.defaultBorderRadius,
          ),
        ),
      ),
    ),
  );
}
