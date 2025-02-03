import 'package:flutter/material.dart';
import 'package:getx_crypto_app/features/splash/view_model/splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SplashViewModel _splashViewModel = SplashViewModel();

  @override
  void initState() {
    super.initState();
    _splashViewModel.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
