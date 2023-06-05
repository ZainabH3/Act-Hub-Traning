
import 'package:act_hub_training/config/dependency-injection.dart';
import 'package:act_hub_training/core/storage/local/app-settings-shared-preferences.dart';
import 'package:get/get.dart';

import '../../../../config/constants.dart';
import '../../../../routes/routes.dart';



class SplashController extends GetxController {
  final AppSettingsSharedPreferences _appSettingsSharedPreferences =
  instance<AppSettingsSharedPreferences>();

  @override
  void onInit() {
    super.onInit();
    Future.delayed(
        const Duration(
          seconds: Constants.splashDuration,
        ), () {
      if (_appSettingsSharedPreferences.getOutBoardingViewed()) {
        if (_appSettingsSharedPreferences.loggedIn()) {
          Get.offAllNamed(Routes.homeView);
        } else {
          Get.offAllNamed(Routes.loginView);
        }
      } else {
        Get.offAllNamed(
          Routes.outBoardingView,
        );
      }
    });
  }
}