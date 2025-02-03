import 'package:flutter/material.dart';
import 'package:getx_crypto_app/features/crypto/presentation/view/home_view.dart';
import 'package:getx_crypto_app/features/splash/view/splash_view.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (context) => SplashView(),
      home: (context) => HomeView(),
    };
  }
}
