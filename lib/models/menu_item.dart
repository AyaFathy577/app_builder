import 'package:app_builder/models/menu_item_parameter.dart';
import 'package:app_builder/utilities/component_enum.dart' as componentEnum;

class MenuItem {
  componentEnum.Component? component;
  MenuItemParameter? parameters;
  String? title;

  MenuItem.fromJson(Map<String, dynamic> json) {
    component = json['component'] == "posts"
        ? componentEnum.Component.PostList
        : json['component'] == "external-page"
            ? componentEnum.Component.WebView
            : componentEnum.Component.Unknown;
    parameters = MenuItemParameter.fromJson(json['parameters']);
    title = json['title'];
  }
}
