import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/features/cart/cart_screen.dart';
import 'package:ecommerce_app/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../features/auth/login/login_screen.dart';
import '../../features/auth/register/register_screen.dart';
import '../../features/main_layout/main_layout.dart';
import '../resources/constants_manager.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.mainLayoutRoute:
        return MaterialPageRoute(builder: (_) => MainLayout());
      case Routes.cartRoute:
        return MaterialPageRoute(builder: (_) => CartScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppConstants.notFoundPage),
              ),
              body: const Center(child: Text(AppConstants.notFoundPage)),
            ));
  }
}
