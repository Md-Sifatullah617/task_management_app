import 'package:flutter/material.dart';
import 'package:task_management_app/Component/bottom_app_bar.dart';
import 'package:task_management_app/Component/cancle_task_list.dart';
import 'package:task_management_app/Component/comleted_task_list.dart';
import 'package:task_management_app/Component/new_task_list.dart';
import 'package:task_management_app/Component/progress_task_list.dart';

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

  final widgetOptions = [
    const NewTaskList(),
    const ProgressTaskList(),
    const CompletedTaskList(),
    const CancelTaskList()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Task Management",
          style: TextStyle(fontFamily: 'poppins', fontWeight: FontWeight.bold),
        ),
      ),
      body: widgetOptions.elementAt(bottomTabIndex),
      bottomNavigationBar: appBottomNav(bottomTabIndex, onTappedIndexChange),
    );
  }
}
