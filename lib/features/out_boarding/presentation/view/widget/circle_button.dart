import 'package:flutter/cupertino.dart';

import '../../../../../core/resources/manager-colors.dart';
import '../../../../../core/resources/manager_sizes.dart';
import '../../../../../core/widgets/main-button.dart';

Widget circleButton({
  required void Function() onPressed,
  required IconData iconData,
}) {
  return mainButton(
    onPressed: onPressed,
    child: Icon(
      iconData,
      color: ManagerColors.iconColor,
    ),
    shapeBorder: const CircleBorder(),
    minWidth: ManagerWidth.w50,
    height: ManagerHeight.h50,
    color: ManagerColors.primaryColor,
  );
}