import 'package:act_hub_training/core/storage/local/app-settings-shared-preferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/internet_checker/internet_checker.dart';
import '../core/network/app-api.dart';
import '../core/network/doi-factory.dart';
import '../features/auth/data/data_source/remote-data-source.dart';
import '../features/auth/data/repository_impl/login_repository_impl.dart';
import '../features/auth/domain/repository/login_repository.dart';
import '../features/auth/domain/use-case/login-use-case.dart';
import '../features/auth/presentation/ controller/login-controller.dart';
import '../features/auth/presentation/ controller/regsiter_controller.dart';
import '../features/out_boarding/presentation/controller/out_boarding_controller.dart';
import '../features/splash/presentation/controller/splash_controller.dart';


final instance = GetIt.instance;

initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences =
  await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(
        () => sharedPreferences,
  );

  instance.registerLazySingleton<AppSettingsSharedPreferences>(
          () => AppSettingsSharedPreferences(instance()));

  // TODO: ONLY FOR TEST
  // AppSettingsSharedPreferences appSettingsSharedPreferences =
  //     instance<AppSettingsSharedPreferences>();
  // appSettingsSharedPreferences.clear();

  instance.registerLazySingleton(() => DioFactory());

  Dio dio = await instance<DioFactory>().getDio();

  instance.registerLazySingleton<AppApi>(
        () => AppApi(dio),
  );

  instance.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImpl(
      InternetConnectionCheckerPlus(),
    ),
  );
}

initSplash() {
  Get.put<SplashController>(SplashController());
}

disposeSplash() {
  Get.delete<SplashController>();
}

initOutBoarding() {
  disposeSplash();
  Get.put<OutBoardingController>(OutBoardingController());
}

disposeOutBoarding() {
  Get.delete<OutBoardingController>();
}

initLoginModule() {
  if (!GetIt.I.isRegistered<RemoteLoginDataSource>()) {
    instance.registerLazySingleton<RemoteLoginDataSource>(
          () => RemoteLoginDataSourceImplement(
        instance<AppApi>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<LoginRepository>()) {
    instance.registerLazySingleton<LoginRepository>(
          () => LoginRepositoryImpl(
        instance(),
        instance(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(
          () => LoginUseCase(
        instance<LoginRepository>(),
      ),
    );
  }

  Get.put<LoginController>(LoginController());

}

initRegisterModule() {
  Get.put<RegisterController>(RegisterController());
}