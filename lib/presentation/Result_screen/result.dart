import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:phish_defender/api_end_points/data.dart';
import 'package:phish_defender/core/colors.dart';
import 'package:phish_defender/core/constants.dart';
import 'package:phish_defender/core/textstyle.dart';
import 'package:phish_defender/presentation/Result_screen/Widgets/tablewidget.dart';

class ResultScreen extends StatelessWidget {
  static const routename = "result-screen";
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ValueListenableBuilder(
                  valueListenable: Datadb.instance.letternotifier,
                  builder: (context, value, _) {
                    if (Datadb.instance.letternotifier.value.isEmpty &&
                        Datadb.instance.tablenotifier.value.isEmpty) {
                      return Lottie.asset(
                        lottieLoadingAnimation,
                        height: 150,
                        width: 150,
                      );
                    } else if (Datadb
                            .instance.letternotifier.value.isNotEmpty &&
                        Datadb.instance.tablenotifier.value.isNotEmpty) {
                      return Column(
                        children: [
                          Text(
                            //"hello",
                            Datadb.instance.letternotifier.value[0],
                            style: dummystyle,
                            textAlign: TextAlign.center,
                          ),
                          const TableWidget(),
                          ElevatedButton(
                            onPressed: () {
                              Datadb.instance.letternotifier.value.clear();
                              Datadb.instance.tablenotifier.value.clear();
                              Navigator.of(context).pop();
                            },
                            child: const Text("back"),
                          ),
                        ],
                      );
                    } else {
                      return const Text(
                        'No data available',
                        style: TextStyle(color: Colors.red),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
