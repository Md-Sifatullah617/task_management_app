import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app_flutter/controller/task_controller.dart';

import '../../style/style.dart';

class TaskCreateScreen extends StatefulWidget {
  const TaskCreateScreen({super.key});

  @override
  State<TaskCreateScreen> createState() => _TaskCreateScreenState();
}

class _TaskCreateScreenState extends State<TaskCreateScreen> {
  final TaskController taskController = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: colorGreen, title: const Text("Create New Task")),
      body: SingleChildScrollView(
        child: Stack(alignment: Alignment.topCenter, children: [
          screenBackground(
            context,
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Obx(
              () => taskController.loading.value
                  ? const Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Add New Task",
                              style: head1Text(colorDarkBlue),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: taskController.titleController,
                              decoration: appInputDecoration("Task Name"),
                              onChanged: (textValue) {
                                debugPrint("Text Value: $textValue");
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: taskController.descriptionController,
                              decoration: appInputDecoration("Description"),
                              maxLines: 10,
                              onChanged: (textValue) {
                                debugPrint("Text Value: $textValue");
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  if (taskController
                                      .titleController.text.isEmpty) {
                                    customToast(
                                        isError: true, "Title Required !");
                                  } else if (taskController
                                      .descriptionController.text.isEmpty) {
                                    customToast(
                                        isError: true,
                                        "Description Required !");
                                  } else {
                                    taskController.createTask();
                                  }
                                },
                                style: appButtonStyle(),
                                child: successButtonChild("Create"))
                          ],
                        ),
                      ),
                    ),
            ),
          )
        ]),
      ),
    );
  }
}
