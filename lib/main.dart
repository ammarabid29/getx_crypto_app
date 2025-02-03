import 'package:flutter/material.dart';
import 'package:getx_crypto_app/core/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:getx_crypto_app/core/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await registerServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        textTheme: GoogleFonts.quicksandTextTheme(),
      ),
      routes: AppRoutes.getRoutes(),
      initialRoute: AppRoutes.splash,
    );
  }
}
