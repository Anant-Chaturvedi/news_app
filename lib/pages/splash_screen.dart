import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_api_infiny/pages/HomePage.dart';


Size? mq;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  dynamic checkUser() async {
   
      Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(builder: (context) => const HomePage()),
          (route) => false);

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () => checkUser());
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: SizedBox(
              height: 100,
              child: Image.asset('assets/newspaper.png'))),
            Text('Welcome to the world of News!', style: TextStyle(color: Colors.indigo, fontSize: 22, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
