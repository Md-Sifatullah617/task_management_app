import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/task_controller.dart';
import 'tast_list.dart';

class CompletedTaskList extends StatelessWidget {
   CompletedTaskList({super.key});

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
                taskController.loadTasks();
              },
              child: taskList(
                context,
                taskController,
                taskController.completeTaskItems,
              ),
            ),
    );
  }
}
