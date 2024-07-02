import 'package:flutter/material.dart';
import 'package:phish_defender/core/colors.dart';
import 'package:phish_defender/core/routermap.dart';
import 'package:phish_defender/presentation/Splash_screen/splashscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kgrey),
        useMaterial3: true,
        scaffoldBackgroundColor: kblack,
      ),
      home: const SplashScreen(),
      routes: routers,
    );
  }
}
