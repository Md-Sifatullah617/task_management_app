import 'package:flutter/material.dart';
import 'package:task_management_app/Component/bottom_app_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int bottomTabIndex = 0;
  onTappedIndexChange(int index) {
    setState(() {
      bottomTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Task Management",
          style: TextStyle(fontFamily: 'poppins', fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: const [],
      ),
      bottomNavigationBar: appBottomNav(bottomTabIndex, onTappedIndexChange),
    );
  }
}
