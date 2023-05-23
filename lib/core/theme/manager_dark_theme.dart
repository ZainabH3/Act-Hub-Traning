
import 'package:flutter/material.dart';

import '../../config/constants.dart';
import '../resources/manager-colors.dart';
import '../resources/manager_font.dart';
import '../resources/manager_styles.dart';
import '../resources/manager_text_theme_dark.dart';
import '../resources/manager_text_theme_light.dart';

ThemeData managerDarkThemeData() {
  return ThemeData.dark().copyWith(
    useMaterial3: true,

    /// MAIN COLORS APP
    primaryColor: ManagerColors.primaryColor,
    primaryColorDark: ManagerColors.primaryColorDark,

    // this for disabled button colors
    disabledColor: ManagerColors.textColor,
    splashColor: ManagerColors.greyLight,
    scaffoldBackgroundColor: ManagerColors.scaffoldBackgroundColorDark,

    /// APP BAR THEME
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ManagerColors.greyLight,
      elevation: Constants.elevationAppBar,
      titleTextStyle: getBoldTextStyle(
        fontSize: ManagerFontSize.s14,
        color: ManagerColors.primaryColor,
      ),
    ),

    /// BUTTON THEME
    buttonTheme: const ButtonThemeData(
      shape: RoundedRectangleBorder(),
      disabledColor: ManagerColors.greyLight,
      buttonColor: ManagerColors.buttonColorDarK,
    ),

    textTheme: ManagerTextThemeDark(),
  );
}