import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app_flutter/controller/task_controller.dart';

import '../style/style.dart';
import 'tast_list.dart';

class NewTaskList extends StatefulWidget {
  const NewTaskList({super.key});

  @override
  State<NewTaskList> createState() => _NewTaskListState();
}

class _NewTaskListState extends State<NewTaskList> {
  final TaskController taskController = Get.find<TaskController>();
  // List counttask = [];
  // int newtaskcount = 0,
  //     completetaskcount = 0,
  //     progresstaskcount = 0,
  //     canceltaskcount = 0;

  // List taskItems = [];
  // bool loading = true;
  // String Status = "New";

  // @override
  // initState() {
  //   super.initState();
  //   callData();
  //   tastCount();
  // }

  // tastCount() async {
  //   var data = await taskCountRequest();
  //   setState(() {
  //     counttask = data;
  //     newtaskcount = 0;
  //     completetaskcount = 0;
  //     progresstaskcount = 0;
  //     canceltaskcount = 0;
  //     for (var element in counttask) {
  //       if (element["_id"] == "New") {
  //         newtaskcount = element["sum"];
  //       } else if (element["_id"] == "Completed") {
  //         completetaskcount = element["sum"];
  //       } else if (element["_id"] == "Progress") {
  //         progresstaskcount = element["sum"];
  //       } else if (element["_id"] == "Canceled") {
  //         canceltaskcount = element["sum"];
  //       }
  //     }
  //   });
  // }

  // callData() async {
  //   var data = await taskLIstRequest("New");
  //   setState(() {
  //     loading = false;
  //     taskItems = data;
  //   });
  // }

  // String status = 'New';
  // updateStatus(id) async {
  //   setState(() {
  //     loading = true;
  //   });
  //   await updateTaskRequest(id, status);
  //   await callData();
  //   setState(() {
  //     status = "New";
  //   });
  // }

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
