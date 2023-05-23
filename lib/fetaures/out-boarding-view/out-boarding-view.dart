import 'package:act_hub_training/core/resources/manager_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/resources/manager-assets.dart';
import '../../core/resources/manager-colors.dart';
import '../../core/resources/manager_font.dart';
import '../../core/resources/manager_strings.dart';
import '../../core/resources/manager_styles.dart';
import '../../core/widgets/main-button.dart';
import '../splash/presentaion/view/widget/slider-indicator.dart';


class OutBoardingView extends StatelessWidget {
  const OutBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: ManagerWidth.w16,
            vertical: ManagerHeight.h10,
          ),
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: mainButton(
                    child: Text(
                      ManagerStrings.skip,
                      style: getRegularTextStyle(
                        fontSize: ManagerFontSize.s16,
                        color: ManagerColors.textColor,
                      ),
                    )),
              ),
              Expanded(
                child: PageView(
                  children: [
                    Column(
                      children: [
                        SizedBox(height: ManagerHeight.h70),
                        SvgPicture.asset(
                          ManagerAssets.outBoardingIllustration1,
                          width: double.infinity,
                          height: ManagerHeight.h206,
                        ),
                        SizedBox(height: ManagerHeight.h70),
                        const SliderIndicator(),
                        SizedBox(height: ManagerHeight.h50),
                        Text(
                          ManagerStrings.outBoardingTitle1,
                          style: getBoldTextStyle(
                            fontSize: ManagerFontSize.s34,
                            color: ManagerColors.textColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: ManagerHeight.h20),
                        Text(
                          ManagerStrings.outBoardingSubTitle1,
                          style: getTextStyle(
                              fontSize: ManagerFontSize.s16,
                              color: ManagerColors.textColorLight,
                              weight: ManagerFontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: ManagerHeight.h40),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: ManagerHeight.h70),
                        SvgPicture.asset(
                          ManagerAssets.outBoardingIllustration1,
                          width: double.infinity,
                          height: ManagerHeight.h206,
                        ),
                        SizedBox(height: ManagerHeight.h70),
                        const SliderIndicator(),
                        SizedBox(height: ManagerHeight.h50),
                        Text(
                          ManagerStrings.outBoardingTitle1,
                          style: getBoldTextStyle(
                            fontSize: ManagerFontSize.s34,
                            color: ManagerColors.textColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: ManagerHeight.h20),
                        Text(
                          ManagerStrings.outBoardingSubTitle1,
                          style: getTextStyle(
                              fontSize: ManagerFontSize.s16,
                              color: ManagerColors.textColorLight,
                              weight: ManagerFontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: ManagerHeight.h40),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: ManagerHeight.h70),
                        SvgPicture.asset(
                          ManagerAssets.outBoardingIllustration1,
                          width: double.infinity,
                          height: ManagerHeight.h206,
                        ),
                        SizedBox(height: ManagerHeight.h70),
                        const SliderIndicator(),
                        SizedBox(height: ManagerHeight.h50),
                        Text(
                          ManagerStrings.outBoardingTitle1,
                          style: getBoldTextStyle(
                            fontSize: ManagerFontSize.s34,
                            color: ManagerColors.textColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: ManagerHeight.h20),
                        Text(
                          ManagerStrings.outBoardingSubTitle1,
                          style: getTextStyle(
                              fontSize: ManagerFontSize.s16,
                              color: ManagerColors.textColorLight,
                              weight:  ManagerFontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: ManagerHeight.h40),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: mainButton(
                    child: const Icon(
                      Icons.arrow_forward_outlined,
                      color:   ManagerColors.iconColor,
                    ),
                    shapeBorder: const CircleBorder(),
                    minWidth: ManagerWidth.w50,
                    height: ManagerHeight.h50,
                    color: ManagerColors.primaryColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}