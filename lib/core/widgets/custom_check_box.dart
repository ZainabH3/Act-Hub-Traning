import 'package:flutter/material.dart';

import '../resources/manager-colors.dart';
import '../resources/manager_sizes.dart';

Checkbox customCheckbox({
  required bool state,
  required void Function(bool?) onChanged,
}) {
  return Checkbox(
    value: state,
    onChanged: onChanged,
    activeColor: ManagerColors.primaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        ManagerRadius.r4,
      ),
    ),
  );
}
