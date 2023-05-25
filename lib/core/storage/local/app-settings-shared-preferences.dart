import 'package:act_hub_training/core/extensions/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/constants.dart';

class AppSettingSharedPreferences{


  late final SharedPreferences _sharedPreferences;
  AppSettingSharedPreferences (this._sharedPreferences);

  Future<void> setOutBoardingViewed() async {
    await _sharedPreferences.setBool(
      ConstantsPrefsKeys.outBoardingViewedKey,
      true,
    );
  }

  bool getOutBoardingViewed() {
    return _sharedPreferences
        .getBool(
      ConstantsPrefsKeys.outBoardingViewedKey,
    )


        .onNull();
  }
}


