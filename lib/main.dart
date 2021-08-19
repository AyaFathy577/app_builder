import 'package:app_builder/config/loaded_app_data.dart';
import 'package:app_builder/providers/connectivity_provider.dart';
import 'package:app_builder/providers/posts_provider.dart';
import 'package:app_builder/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(MyApp());
  await LoadedAppData().loadJsonData();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PostsProvider()),
        ChangeNotifierProvider(create: (context) => ConnectivityProvider()),
      ],
      child: MaterialApp(
        title: 'App Builder',
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
