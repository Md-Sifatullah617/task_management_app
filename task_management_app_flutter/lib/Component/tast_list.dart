import 'package:flutter/material.dart';
import 'package:task_management_app_client/task_management_app_client.dart';
import '../style/style.dart';

ListView taskList(List<Task> taskItems, deleteItems, statusChange) {
  return ListView.builder(
      itemCount: taskItems.length,
      itemBuilder: (context, index) {
        Color statusColor = colorGreen;
        if (taskItems[index]['status'] == "New") {
          statusColor = colorBlue;
        } else if (taskItems[index]['status'] == "Progress") {
          statusColor = colorOrange;
        } else if (taskItems[index]['status'] == "Canceled") {
          statusColor = colorRed;
        }
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: containerCard(Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                taskItems[index]['title'],
                style: head1Text(colorDarkBlue),
              ),
              Text(
                taskItems[index]['description'],
                style: head7Text(colorLightGray),
              ),
              Text(
                taskItems[index]['createdDate'],
                style: head9Text(colorDarkBlue),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  statusChild(taskItems[index]['status'], statusColor),
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () {
                            statusChange(taskItems[index]['_id']);
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
                            deleteItems(taskItems[index]['_id']);
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
