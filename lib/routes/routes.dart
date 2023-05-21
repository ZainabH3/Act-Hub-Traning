
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/dependency-injection.dart';
import '../core/resources/manager_strings.dart';

import '../fetaures/out-boarding-view/out-boarding-view.dart';
import '../fetaures/splash/presentaion/view/splash-view.dart';




class Routes {
  static const String splashView = '/splash_view';
  static const String outBoardingView = '/out_boarding_view';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        initSplash();
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.outBoardingView:
        return MaterialPageRoute(builder: (_) => const OutBoardingView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title:  const Text(ManagerStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(ManagerStrings.noRouteFound),
        ),
      ),
    );
  }
}