import 'package:flutter/material.dart';
import 'package:phish_defender/core/colors.dart';
import 'package:phish_defender/core/textstyle.dart';
import 'package:phish_defender/presentation/Home/Widgets/homescreenwidget.dart';
import 'package:phish_defender/presentation/Home/Widgets/userawareness.dart';

class HomeScreen extends StatelessWidget {
  static const routename = "home-screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
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
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                //top tabs
                TabBar(
                  isScrollable: true,
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  dividerColor: ktransparent,
                  padding: const EdgeInsets.all(50),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                    color: kwhite,
                  ),
                  labelColor: kblack,
                  unselectedLabelColor: kgrey,
                  labelStyle: tabbartext,
                  tabAlignment: TabAlignment.center,
                  tabs: const [
                    Tab(
                      text: "🤖 AI",
                    ),
                    Tab(
                      text: "🪝 Check",
                    ),
                  ],
                ),
                //pages on tabbar view
                const Expanded(
                  child: TabBarView(
                    children: [
                      //ai
                      AiScreen(),
                      //check
                      HomeButtonandTextfield(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
