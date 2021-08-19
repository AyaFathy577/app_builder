import 'package:app_builder/config/loaded_app_data.dart';
import 'package:app_builder/models/menu_item.dart';
import 'package:app_builder/providers/posts_provider.dart';
import 'package:app_builder/utilities/component_enum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuItemWidget extends StatelessWidget {
  final MenuItem? menuItem;
  final int? index;
  final bool selected;
  final Function(int)? updateCurrentIndex;

  const MenuItemWidget(
      {@required this.menuItem,
      @required this.index,
      this.selected = false,
      @required this.updateCurrentIndex,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: selected
          ? LoadedAppData.appColors.menuItemSelectedBgColor
          : LoadedAppData.appColors.menuItemBGColor,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(
          menuItem?.title ?? '',
          style: TextStyle(color: LoadedAppData.appColors.textColor),
        ),
        onTap: () async {
          updateCurrentIndex!(index!);
          var provider = Provider.of<PostsProvider>(context, listen: false);
          if (menuItem?.component == Component.PostList) {
            provider.getPostsByUserId(
                apiName: menuItem?.parameters?.apiName,
                userId: menuItem?.parameters?.userId);
          } else if (menuItem?.component == Component.WebView) {
            String url = menuItem?.parameters?.url ?? "";
            await canLaunch(url)
                ? await launch(url)
                : throw 'Could not launch $url';
          } else if (menuItem?.component == Component.Unknown) {
            print(Component.Unknown);
          } else {
            print("Is not defined");
          }
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
