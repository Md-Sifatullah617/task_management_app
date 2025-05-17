import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:task_management_app_client/task_management_app_client.dart';
import 'package:task_management_app_flutter/controller/task_controller.dart';

import '../style/style.dart';

taskList(
    BuildContext context, TaskController controller, List<Task> taskItems) {
  deleteItems(id) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Delete"),
            content: const Text("Once delete, you can't get it back"),
            actions: [
              OutlinedButton(
                  onPressed: () async {
                    controller.deleteTask(id);
                  },
                  child: const Text("Yes")),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("No")),
            ],
          );
        });
  }

  statusChange(id) async {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (constext, StateSetter setState) {
            return Container(
              padding: const EdgeInsets.all(30),
              height: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ...List.generate(TaskStatus.values.length, (index) {
                    return Obx(
                      () => RadioListTile(
                        title: Text(TaskStatus.values[index].name),
                        value: TaskStatus.values[index],
                        groupValue: controller.status.value,
                        onChanged: (value) {
                          controller.status.value = value!;
                        },
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        controller.updateStatusById(id);
                      },
                      style: appButtonStyle(),
                      child: successButtonChild("Confirm"))
                ],
              ),
            );
          });
        });
  }

  if (taskItems.isEmpty) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            "assets/images/no data.json",
            height: 200,
            repeat: false,
          ),
          Text("No ${controller.status.value} Task Found"),
        ],
      ),
    );
  }
  return ListView.builder(
      itemCount: taskItems.length,
      itemBuilder: (context, index) {
        Color statusColor = colorGreen;
        if (taskItems[index].status == TaskStatus.New) {
          statusColor = colorBlue;
        } else if (taskItems[index].status == TaskStatus.Progress) {
          statusColor = colorOrange;
        } else if (taskItems[index].status == TaskStatus.Canceled) {
          statusColor = colorRed;
        }

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: containerCard(Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                taskItems[index].title,
                style: head1Text(colorDarkBlue),
              ),
              Text(
                taskItems[index].description,
                style: head7Text(colorLightGray),
              ),
              Text(
                taskItems[index].createdAt.toString(),
                style: head9Text(colorDarkBlue),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  statusChild(taskItems[index].status.name, statusColor),
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () {
                            statusChange(taskItems[index].id);
                          },
                          style: tinyButtonStyle(colorBlue),
                          child: const Icon(
                            Icons.edit_note_outlined,
                            size: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 50,
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () {
                            deleteItems(taskItems[index].id);
                          },
                          style: tinyButtonStyle(colorRed),
                          child: const Icon(
                            Icons.delete_outline,
                            size: 16,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          )),
        );
      });
}
