import 'package:act_hub_training/features/auth/presentation/view/login-view.dart';
import 'package:flutter/material.dart';
import '../config/dependency-injection.dart';
import '../core/resources/manager_strings.dart';
import '../features/auth/home/presentation/view/home_view.dart';
import '../features/auth/presentation/view/register_view.dart';
import '../features/out_boarding/presentation/view/out_boarding_view.dart';
import '../features/splash/presentation/view/splash_view.dart';

class Routes {
  static const String splashView = '/splash_view';
  static const String outBoardingView = '/out_boarding_view';
  static const String loginView = '/login_view';
  static const String homeView = '/home_view';
  static const String registerView = '/register_view';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        initSplash();
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.outBoardingView:
        initOutBoarding();
        return MaterialPageRoute(builder: (_) => const OutBoardingView());
      case Routes.loginView:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.registerView:
        initRegisterModule();
        return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.homeView:
        return MaterialPageRoute(builder: (_) => const HomeView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(ManagerStrings.noRoutFound),
        ),
        body: const Center(
          child: Text(ManagerStrings.noRoutFound),
        ),
      ),
    );
  }
}
