
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';



import '../fetaures/splash/presentaion/controller/splash-controller.dart';

final instance = GetIt.instance;

initSplash() {
  Get.put<SplashController>(SplashController());
}

finishSplash(){
  Get.delete<SplashController>();
}

initOutBoarding(){
  finishSplash();
}