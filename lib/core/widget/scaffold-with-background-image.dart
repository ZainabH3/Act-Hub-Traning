import 'package:flutter/material.dart';

import '../resources/manager-assets.dart';
import '../resources/manager-colors.dart';


Scaffold scaffoldWithBackground({required Widget child}) {
  return Scaffold(
    backgroundColor: ManagerColors.primaryColor,
    body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            ManagerAssets.background,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    ),
  );
}