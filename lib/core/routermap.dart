import 'package:phish_defender/presentation/Home/Widgets/homescreenwidget.dart';
import 'package:phish_defender/presentation/Home/home.dart';
//import 'package:phish_defender/presentation/Result_screen/loadingscreen.dart';
import 'package:phish_defender/presentation/Result_screen/result.dart';

final routers = {
  ResultScreen.routename: (ctx) => const ResultScreen(),
  HomeScreen.routename: (ctx) => const HomeScreen(),
  //.roLoadingscreenutename:(ctx)=>const Loadingscreen(),
  HomeButtonandTextfield.routename:(ctx)=>const HomeButtonandTextfield()
};
