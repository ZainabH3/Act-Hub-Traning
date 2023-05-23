import 'package:flutter/cupertino.dart';

import '../../../../../config/constants.dart';
import '../../../../../core/resources/manager-colors.dart';
import '../../../../../core/resources/manager_sizes.dart';

class SliderIndicator extends StatelessWidget {
  const SliderIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w65),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ManagerRadius.r12),
        color: ManagerColors.greyLight,
      ),
      width: double.infinity,
      height: ManagerHeight.h4,
      child: Row(
        children: [
          ...List.generate(
            3,
                (index) => Expanded(
              child: AnimatedContainer(
                duration:  const Duration(
                  seconds: Constants.outBoardingDurationTime,
                ),
                curve: Curves.fastLinearToSlowEaseIn,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    ManagerRadius.r12,
                  ),
                  color: index == 0
                      ? ManagerColors.primaryColor
                      : ManagerColors.greyLight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}