import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app_flutter/controller/task_controller.dart';

import '../style/style.dart';
import 'tast_list.dart';

class NewTaskList extends StatelessWidget {
   NewTaskList({super.key});

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
              child: Column(
                children: [
                  Row(
                    children: [
                      statuscount("New", taskController.newTaskItems.length),
                      statuscount(
                          "Progress", taskController.progressTaskItems.length),
                      statuscount(
                          "Completed", taskController.completeTaskItems.length),
                      statuscount(
                          "Canceled", taskController.cancelTaskItems.length),
                    ],
                  ),
                  Expanded(
                      child: taskList(
                    context,
                    taskController,
                    taskController.newTaskItems,
                  )),
                ],
              )),
    );
  }
}
