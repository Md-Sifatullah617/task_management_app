import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app_flutter/controller/task_controller.dart';

import 'tast_list.dart';

class CancelTaskList extends StatelessWidget {
  CancelTaskList({super.key});

  final TaskController taskController = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => taskController.loading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () async {
                await taskController.loadTasks();
              },
              child: taskList(
                context,
                taskController,
                taskController.cancelTaskItems,
              )),
    );
  }
}
