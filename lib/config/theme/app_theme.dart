import 'package:flutter/material.dart';
import 'package:flutter_notes_app/config/theme/text_styles.dart';

import 'style_constants.dart';
import 'app_colors.dart';

class AppTheme {
  static final darkColorScheme = ColorScheme.dark(
    primary: DarkAppColors.primaryDarkColor,
    secondary: DarkAppColors.secondary,
    surface: DarkAppColors.primaryDarkColor,
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: darkColorScheme,

    // [panara_dialogs] theme depends on these
    dialogBackgroundColor: DarkAppColors.primaryDarkColor,
    hintColor: Colors.grey,
    appBarTheme: AppBarTheme(
      backgroundColor: DarkAppColors.secondaryDarkColor,
      scrolledUnderElevation: 0,
    ),
    useMaterial3: true,
    primaryColor: DarkAppColors.primaryDarkColor,
    primaryColorDark: DarkAppColors.primaryDarkColor,
    scaffoldBackgroundColor: DarkAppColors.secondaryDarkColor,
    textTheme: textTheme,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
      backgroundColor: DarkAppColors.secondary,
    ),
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
