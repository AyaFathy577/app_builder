import 'package:app_builder/config/loaded_app_data.dart';
import 'package:app_builder/models/post.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final Post? post;

  const CardWidget({@required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: LoadedAppData.appColors.listItemBg,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post?.title ?? "",
              style: TextStyle(
                color: LoadedAppData.appColors.listTitle,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              post?.body ?? "",
              style: TextStyle(
                color: LoadedAppData.appColors.textColor,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
