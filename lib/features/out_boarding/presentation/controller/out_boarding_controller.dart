import 'dart:core';


import 'package:act_hub_training/config/dependency-injection.dart';
import 'package:act_hub_training/core/storage/local/app-settings-shared-preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../config/constants.dart';
import '../../../../core/resources/manager-assets.dart';

import '../../../../core/resources/manager_strings.dart';
import '../../../../routes/routes.dart';
import '../view/widget/out_boarding_item.dart';

class OutBoardingController extends GetxController {

  final AppSettingSharedPreferences _appSettingSharedPreferences = instance <AppSettingSharedPreferences>();


  late PageController pageController;
  static const firstPage = 0;
  static const lastPage = 2;
  int currentPage = firstPage;

  final List pageViewItems = [
    OutBoardingItem(
      image: ManagerAssets.outBoardingIllustration1,
      title: ManagerStrings.outBoardingTitle1,
      subTitle: ManagerStrings.outBoardingSubTitle1,
    ),
    OutBoardingItem(
      image: ManagerAssets.outBoardingIllustration2,
      title: ManagerStrings.outBoardingTitle2,
      subTitle: ManagerStrings.outBoardingSubTitle2,
    ),
    OutBoardingItem(
      image: ManagerAssets.outBoardingIllustration3,
      title: ManagerStrings.outBoardingTitle3,
      subTitle: ManagerStrings.outBoardingSubTitle3,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }


  Future<void> setCurrentPage(int index) async {
    await _appSettingSharedPreferences.setOutBoardingViewed();
    currentPage = index;
    update();
  }



  void skipPage() {
    animateToPage(index: lastPage);
    currentPage = lastPage;
    update();
  }

  void nextPage() {
    if (isNotLastedPage()) {
      animateToPage(index: ++currentPage);
      update();
    }
  }
  Future<void> getStart() async {
    await  _appSettingSharedPreferences.setOutBoardingViewed();
    Get.offAllNamed(Routes.loginView);
  }

  void previousPage() {
    if (isNotFirstPage()) {
      animateToPage(index: --currentPage);
      update();
    }
  }

  Future<void> animateToPage({required int index}) {
    return pageController.animateToPage(
      index,
      duration: const Duration(seconds: Constants.outBoardingDurationTime),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  bool isNotLastedPage() {
    return currentPage < lastPage;
  }

  bool isNotFirstPage() {
    return currentPage > firstPage;
  }

  bool showBackButton() {
    return currentPage > firstPage && currentPage < lastPage;
  }
}