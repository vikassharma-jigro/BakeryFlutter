import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class AppTranslations extends Translations {
  static Map<String, Map<String, String>> localizedValues = {};

  static Future<void> init() async {
    localizedValues['en'] =
    Map<String, String>.from(json.decode(await rootBundle.loadString("assets/languages/en.json")));

    localizedValues['hi'] =
    Map<String, String>.from(json.decode(await rootBundle.loadString("assets/languages/hi.json")));

    localizedValues['it'] =
    Map<String, String>.from(json.decode(await rootBundle.loadString("assets/languages/it.json")));
  }

  @override
  Map<String, Map<String, String>> get keys => localizedValues;
}
