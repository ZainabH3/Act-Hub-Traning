import 'package:act_hub_training/core/extensions/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../resources/manager-colors.dart';
import '../resources/manager_sizes.dart';



Widget mainButton({
  required Widget child,
  void Function()? onPressed,
  ShapeBorder? shapeBorder,
  Color? color,
  double? minWidth,
  double? height,
  double? elevation,
}) {
  return MaterialButton(
    onPressed: onPressed ?? () {},
    shape: shapeBorder ??
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            ManagerRadius.r12,
          ),
        ),
    color: color.onNull(),
    minWidth: minWidth.onNull(),
    height: height.onNull(),
    elevation: elevation.onNull(),
    child: child,
  );
}