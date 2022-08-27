// @dart=2.9
import 'package:flutter/material.dart';
import 'package:news_api_infiny/pages/splash_screen.dart';

import 'pages/HomePage.dart';
import 'pages/NewsPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  

  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: SplashScreen(),);

  }
}
