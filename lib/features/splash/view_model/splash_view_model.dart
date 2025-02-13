import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_crypto_app/core/routes/app_routes.dart';

class SplashViewModel {
  void init(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Get.offNamed(AppRoutes.home);
    });
  }
}
