import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app_client/task_management_app_client.dart';
import 'package:task_management_app_flutter/controller/task_controller.dart';

import '../../Component/bottom_app_bar.dart';
import '../../Component/cancle_task_list.dart';
import '../../Component/comleted_task_list.dart';
import '../../Component/new_task_list.dart';
import '../../Component/progress_task_list.dart';
import '../../Component/task_app_bar.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final TaskController taskController = Get.find<TaskController>();

  final ValueNotifier<int> bottomNavIndex = ValueNotifier(0);

  onTappedIndexChange(int index) {
    bottomNavIndex.value = index;
    taskController.status.value = TaskStatus.values[index];
  }

  final widgetOptions = [
    NewTaskList(),
    ProgressTaskList(),
    CompletedTaskList(),
    CancelTaskList()
  ];

  final Map<String, String> profileDetails = {
    "firstName": "",
    "lastName": "",
    "email": "",
    "photo": "",
  };

  // callStoredData() async {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: taskAppBar(context, profileDetails),
      body: ValueListenableBuilder(
        valueListenable: bottomNavIndex,
        builder: (context, value, child) {
          return widgetOptions.elementAt(value);
        },
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: bottomNavIndex,
        builder: (context, value, child) {
          return appBottomNav(
            value,
            onTappedIndexChange,
          );
        },
      ),
    );
  }
}
