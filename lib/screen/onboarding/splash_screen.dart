import 'package:flutter/material.dart';

import '../../style/style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: [
          screenBackground(context),
          const Padding(
            padding: EdgeInsets.all(30),
            child: Center(child: Image(image: AssetImage("assets/images/esuIT.png"))),
          )
        ],
      ),
    );
  }
}
