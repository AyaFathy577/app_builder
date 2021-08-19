import 'package:flutter/material.dart';
import 'package:app_builder/config/loaded_app_data.dart';

class ConnectionError extends StatelessWidget {
  const ConnectionError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: LoadedAppData.appColors.pageBg,
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/no_connection.png",
              height: 200,
              width: 200,
            ),
            Text(
              "Connection error, please check your connection and tap to try again",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: LoadedAppData.appColors.textColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
