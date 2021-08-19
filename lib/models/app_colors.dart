import 'package:flutter/material.dart';

class AppColors {
  Color? pageBg;
  Color? headerBg;
  Color? headerText;
  Color? menuBg;
  Color? menuItemBGColor;
  Color? menuItemSelectedBgColor;
  Color? listTitle;
  Color? listItemBg;
  Color? textColor;

  AppColors();

  AppColors.fromJson(Map<String, dynamic> json) {
    pageBg = fromHex(json['pageBg']);
    headerBg = fromHex(json['headerBg']);
    headerText = fromHex(json['headerText']);
    menuBg = fromHex(json['menuBg']);
    menuItemBGColor = fromHex(json['menuItemBGColor']);
    menuItemSelectedBgColor = fromHex(json['menuItemSelectedBgColor']);
    listTitle = fromHex(json['listTitle']);
    listItemBg = fromHex(json['listItemBg']);
    textColor = fromHex(json['textColor']);
  }

  Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
