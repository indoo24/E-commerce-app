import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/resources/assets_manager.dart';
import '../../core/routes_manager/routes.dart';
import '../../core/widgets/shared_pref_utils.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    var token = SharedPrefUtils.getDate(key: 'token');
    if (token != null) {
      Navigator.pushReplacementNamed(context, Routes.mainLayoutRoute);
    } else {
      Navigator.pushReplacementNamed(context, Routes.loginRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        ImageAssets.splash,
        fit: BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
