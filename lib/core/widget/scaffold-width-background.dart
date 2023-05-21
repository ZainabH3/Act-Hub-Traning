import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/manager-assets.dart';
import '../resources/manager-colors.dart';


Widget scaffoldWithBackGroundImage({
  required Widget child,
  Color backgroundColor = ManagerColors.primaryColor,
  String image = ManagerAssets.background,
}) {
  return Scaffold(
    backgroundColor: backgroundColor,
    body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    ),
  );
}