


import 'package:act_hub_training/config/dependency-injection.dart';
import 'package:act_hub_training/core/storage/local/app-settings-shared-preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../config/constants.dart';
import '../../../../routes/routes.dart';

class SplashController extends GetxController {

  final AppSettingSharedPreferences _appSettingsSharedPreferences =
   instance<AppSettingSharedPreferences>();

  @override
  void onInit() {
    super.onInit();
    Future.delayed(
        const Duration(
          seconds: Constants.splashDuration,
        ), () {
      if (_appSettingsSharedPreferences.getOutBoardingViewed()) {
        Get.offAllNamed(Routes.loginView);
      } else {
        Get.offAllNamed(
          Routes.outBoardingView,
        );
      }
    });
  }
}