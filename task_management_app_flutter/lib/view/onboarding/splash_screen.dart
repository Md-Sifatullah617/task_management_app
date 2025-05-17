import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app_flutter/main.dart';

import '../../routes.dart';
import '../../style/style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    checkToken();
  }

  Future<void> checkToken() async {
    final bool result = sessionManager.isSignedIn;

    Timer(const Duration(seconds: 2), () {
      if (result) {
        Get.offAllNamed(AppRoutes.mainPage);
      } else {
        Get.offAllNamed(AppRoutes.login);
      }
    });
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
