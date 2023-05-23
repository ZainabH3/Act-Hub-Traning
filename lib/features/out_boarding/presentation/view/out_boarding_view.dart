
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/resources/manager-colors.dart';
import '../../../../core/resources/manager_font.dart';
import '../../../../core/resources/manager_sizes.dart';
import '../../../../core/resources/manager_strings.dart';
import '../../../../core/resources/manager_styles.dart';

import '../../../../core/widgets/main-button.dart';
import '../controller/out_boarding_controller.dart';

class OutBoardingView extends StatelessWidget {
  const OutBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: ManagerWidth.w20,
            vertical: ManagerHeight.h10,
          ),
          child: GetBuilder<OutBoardingController>(builder: (controller) {
            return Column(
              children: [
                Visibility(
                  visible: controller.isLasedPage(),
                  maintainSize: true,
                  maintainState: true,
                  maintainAnimation: true,
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: mainButton(
                      onPressed: () {
                        controller.skipPage();
                      },
                      child: Text(
                        ManagerStrings.skip,
                        style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s16,
                          color: ManagerColors.textColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: controller.pageController,
                    children: [
                      ...controller.pageViewItems,
                    ],
                    onPageChanged: (index) {
                      controller.setCurrentPage(index);
                    },
                  ),
                ),
                Visibility(
                  visible: controller.isLasedPage(),
                  replacement: mainButton(
                      child: Text(
                        ManagerStrings.getStartButton,
                        style: getRegularTextStyle(
                          fontSize: ManagerFontSize.s14,
                          color: ManagerColors.white,
                        ),
                      ),
                      minWidth: double.infinity,
                      height: ManagerHeight.h40,
                      color: ManagerColors.primaryColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: controller.showBackButton(),
                        child: mainButton(
                          onPressed: () {
                            controller.nextPage();
                          },
                          child: const Icon(
                            Icons.arrow_back_outlined,
                            color: ManagerColors.iconColor,
                          ),
                          shapeBorder: const CircleBorder(),
                          minWidth: ManagerWidth.w50,
                          height: ManagerHeight.h50,
                          color: ManagerColors.primaryColor,
                        ),
                      ),
                      mainButton(
                        onPressed: () {
                          controller.nextPage();
                        },
                        child: const Icon(
                          Icons.arrow_forward_outlined,
                          color: ManagerColors.iconColor,
                        ),
                        shapeBorder: const CircleBorder(),
                        minWidth: ManagerWidth.w50,
                        height: ManagerHeight.h50,
                        color: ManagerColors.primaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
