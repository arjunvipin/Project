import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:phish_defender/core/colors.dart';
import 'package:phish_defender/core/constants.dart';
import 'package:phish_defender/core/textstyle.dart';
import 'package:phish_defender/presentation/Home/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //delay fuction
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routename);
    });

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff1b485d), Color(0xff022f46)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.2, 0.6],
          tileMode: TileMode.repeated,
        ),
      ),
      child: Scaffold(
          backgroundColor: ktransparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("lib/images/app_logo_scr.png"),
                    ),
                  ),
                ),
                khight,
                khight,
                AnimatedTextKit(animatedTexts: [
                  ColorizeAnimatedText(
                    'DEFENDER',
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                    speed: const Duration(milliseconds: 400),
                  ),
                ]),
              ],
            ),
          )),
    );
  }
}
