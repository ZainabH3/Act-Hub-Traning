import 'package:act_hub_training/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../resources/manager-colors.dart';
import '../resources/manager_font.dart';
import '../resources/manager_sizes.dart';
import '../resources/manager_styles.dart';

TextFormField baseTextFormField({
  required TextEditingController controller,
  String? hintText,
  TextInputType? keyboardType,
  bool? obscureText,
  validator,
}) {
  return TextFormField(
    style: getRegularTextStyle(
      fontSize: ManagerFontSize.s16,
      color: ManagerColors.black,
    ),
    controller: controller,
    keyboardType: keyboardType,
    cursorColor: ManagerColors.primaryColor,
    obscureText: obscureText.onNull(),
    validator: validator,
    decoration: InputDecoration(
      filled: true,
      contentPadding: EdgeInsets.symmetric(
        horizontal: ManagerWidth.w16,
        vertical: ManagerHeight.h6,
      ),
      fillColor: ManagerColors.white,
      hintText: hintText.onNull(),
      hintStyle: getRegularTextStyle(
        fontSize: ManagerFontSize.s16,
        color: ManagerColors.grey,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ManagerColors.white,
        ),
        borderRadius: BorderRadius.circular(
          ManagerRadius.r6,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ManagerColors.primaryColor,
        ),
        borderRadius: BorderRadius.circular(
          ManagerRadius.r6,
        ),
      ),
    ),
  );
}