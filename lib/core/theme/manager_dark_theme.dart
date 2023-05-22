
import 'package:flutter/material.dart';

import '../resources/manager-colors.dart';

ThemeData managerDarkThemeData() {
  return ThemeData.dark().copyWith(
    useMaterial3: true,
    primaryColor: ManagerColors.primaryColor,
  );
}