import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:phish_defender/api_end_points/uri.dart';
import 'package:phish_defender/model/phishResultGetModels/phishOrnotresult.dart';
import 'package:phish_defender/model/urldetails/urldetails.dart';
//import 'package:phish_defender/presentation/Home/Widgets/homescreenwidget.dart';

abstract class ApiCalls {
  Future<List<String>> getResult(String input);
  Future<List<dynamic>> getTableResult(String input);
}

class Datadb extends ApiCalls {
  final dio = Dio();
  final url = Url();

// singleton ctration start
  Datadb._internal();
  static Datadb instance = Datadb._internal();
  Datadb factory() {
    return instance;
  }
// singleton end

  ValueNotifier<List<String>> letternotifier = ValueNotifier([]);
  ValueNotifier<List<dynamic>> tablenotifier = ValueNotifier([]);

//function used for getting prediction result
  @override
  Future<List<String>> getResult(String input) async {
    try {
      final completepath = url.baseurl + '${input}';
      final response = await dio.get<String>(completepath);
      log(response.data.toString());
      if (response.data != null && response.data is String) {
        final getrespo =
            LetterParseModelGet.fromJson(jsonDecode(response.data.toString()));
        log(getrespo.output.toString());
        // Check if getrespo.output is not null before calling toList()
        if (getrespo.output != null) {
          letternotifier.value.clear();
          letternotifier.value.addAll(getrespo.output!);
          // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
          letternotifier.notifyListeners();
        }
        return getrespo.output ?? [];
      }
    } catch (e) {
      //print(e);
    }

    return [];
  }

// function used for getting table details
  @override
  Future<List<dynamic>> getTableResult(String input) async {
    log("hai");
    try {
      final completepath = url.tableurl + '${input}';
      final response =
          await dio.get<Map<String, dynamic>>(completepath); // Update type here
      if (response.data != null) {
        final gettablerespo = Urldetails.fromJson(response.data!);
        log(gettablerespo.tableout.toString());
        if (gettablerespo.tableout != null) {
          tablenotifier.value.clear();
          tablenotifier.value.addAll(gettablerespo.tableout!);
          // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
          tablenotifier.notifyListeners();
        }
        return gettablerespo.tableout ?? [];
      }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }
}
