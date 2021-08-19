import 'dart:convert';
import 'package:app_builder/models/app_colors.dart';
import 'package:app_builder/models/menu_item.dart';
import 'package:flutter/services.dart';

class LoadedAppData {
  static String baseUrl = '';
  static AppColors appColors = AppColors();
  static List<MenuItem> menuItem = [];

  Future loadJsonData() async {
    String jsonText = await rootBundle.loadString('lib/config/config.json');
    Map<String, dynamic> data = json.decode(jsonText);
    baseUrl = data['mainConfig']['baseUrl'];
    appColors = AppColors.fromJson(data['appColor']);
    List menuItems = data['menuItems'] as List;
    menuItems.forEach((element) {
      menuItem.add(MenuItem.fromJson(element));
    });
  }
}
