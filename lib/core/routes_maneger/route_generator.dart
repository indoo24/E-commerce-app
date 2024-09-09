import 'package:ecommerce_app/core/routes_maneger/routes.dart';
import 'package:ecommerce_app/features/auth_presentation/login/login_screen.dart';
import 'package:ecommerce_app/features/auth_presentation/regester/register_screen.dart';
import 'package:ecommerce_app/features/cart/cubit/cart_screen.dart';
import 'package:ecommerce_app/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.cartRoute:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case Routes.splashScreenRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      default:
        unDefinedScreen();
    }
    return unDefinedScreen();
  }
}

Route<dynamic> unDefinedScreen() {
  return MaterialPageRoute(
      builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text('No routes found'),
            ),
            body: const Center(
              child: Text('No routes found'),
            ),
          ));
}
