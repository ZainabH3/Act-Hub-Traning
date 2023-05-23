import 'package:act_hub_training/features/out_boarding/presentation/view/widget/slider_indicator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/resources/manager-colors.dart';
import '../../../../../core/resources/manager_font.dart';
import '../../../../../core/resources/manager_sizes.dart';
import '../../../../../core/resources/manager_styles.dart';

class OutBoardingItem extends StatelessWidget {
  String image;
  String title;
  String subTitle;

  OutBoardingItem({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: ManagerHeight.h50),
        SvgPicture.asset(
          image,
          width: double.infinity,
          height: ManagerHeight.h206,
        ),
        SizedBox(height: ManagerHeight.h70),
        const SliderIndicator(),
        SizedBox(height: ManagerHeight.h50),
        Text(
          title,
          style: getBoldTextStyle(
            fontSize: ManagerFontSize.s34,
            color: ManagerColors.textColor,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: ManagerHeight.h20),
        Text(
          subTitle,
          style: getTextStyle(
              fontSize: ManagerFontSize.s16,
              color: ManagerColors.textColorLight,
              weight: ManagerFontWeight.w300),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: ManagerHeight.h20),
      ],
    );
  }
}
