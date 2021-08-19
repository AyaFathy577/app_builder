import 'package:app_builder/config/loaded_app_data.dart';
import 'package:app_builder/providers/connectivity_provider.dart';
import 'package:app_builder/providers/posts_provider.dart';
import 'package:app_builder/utilities/connectivity_status_enum.dart';
import 'package:app_builder/utilities/view_state_enum.dart';
import 'package:app_builder/widgets/card_widget.dart';
import 'package:app_builder/widgets/connection_error.dart';
import 'package:app_builder/widgets/menu_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  int? _currentIndex;

  @override
  Widget build(BuildContext context) {
    return Consumer<ConnectivityProvider>(
        builder: (context, connectivityProvider, child) {
      return Scaffold(
        backgroundColor: LoadedAppData.appColors.pageBg,
        appBar: AppBar(
          backgroundColor: LoadedAppData.appColors.headerBg,
          title: Text("App Builder"),
          titleTextStyle: TextStyle(
            color: LoadedAppData.appColors.headerText,
          ),
        ),
        drawer: Drawer(
          child: Container(
            color: LoadedAppData.appColors.menuBg,
            child: ListView.builder(
              itemCount: LoadedAppData.menuItem.length,
              itemBuilder: (context, index) {
                return MenuItemWidget(
                  menuItem: LoadedAppData.menuItem[index],
                  selected: _currentIndex == index,
                  index: index,
                  updateCurrentIndex: (newIndex) {
                    if (_currentIndex != newIndex) {
                      _currentIndex = newIndex;
                    }
                  },
                );
              },
            ),
          ),
        ),
        body: connectivityProvider.networkState != ConnectivityStatus.Offline
            ? Consumer<PostsProvider>(
                builder: (context, postsProvider, child) {
                  return postsProvider.viewState == ViewState.Done
                      ? postsProvider.posts.isNotEmpty
                          ? ListView.builder(
                              itemCount: postsProvider.posts.length,
                              itemBuilder: (context, index) =>
                                  CardWidget(post: postsProvider.posts[index]),
                            )
                          : Center(
                              child: Text(
                                  "No data, you can choose item from side menu"),
                            )
                      : Center(
                          child: CircularProgressIndicator(
                            color: LoadedAppData.appColors.textColor,
                          ),
                        );
                },
              )
            : ConnectionError(),
      );
    });
  }
}
