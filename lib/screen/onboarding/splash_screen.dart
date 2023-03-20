import 'dart:async';

import 'package:flutter/material.dart';

import '../../style/style.dart';
import '../../utility/utilities.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> checkToken() async {
    final bool result = await checkLogin();
    if (result) {
      Timer(const Duration(seconds: 2), () {
        Navigator.pushNamedAndRemoveUntil(
            context, '/mainPage', (route) => false);
      });
    } else {
      Timer(const Duration(seconds: 2), () {
        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
      });
    }
  }

  @override
  initState() {
    super.initState();
    checkToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          screenBackground(context),
          const Padding(
            padding: EdgeInsets.all(30),
            child: Center(
                child: Image(image: AssetImage("assets/images/esuIT.png"))),
          )
        ],
      ),
    );
  }
}
