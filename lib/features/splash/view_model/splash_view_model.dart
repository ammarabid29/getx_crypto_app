import 'dart:async';

import 'package:flutter/material.dart';
import 'package:getx_crypto_app/features/crypto/presentation/view/home_view.dart';

class SplashViewModel {
  void init(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (ctx) => const HomeView(),
        ),
      );
    });
  }
}
