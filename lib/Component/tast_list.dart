import 'package:flutter/material.dart';
import '../style/style.dart';

ListView taskList(taskItems) {
  return ListView.builder(
      itemCount: taskItems.length,
      itemBuilder: (context, index) {
        Color statusColor = colorGreen;
        if (taskItems[index]['status'] == "New") {
          statusColor = colorBlue;
        }else if (taskItems[index]['status'] == "Progress") {
          statusColor = colorOrange;
        }else if (taskItems[index]['status'] == "Canceled") {
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
                children: [
                  statusChild(taskItems[index]['status'], statusColor),
                  Container(
                    child: Row(
                        children: [
                            
                        ],
                    ),
                  )
                ],
              )
            ],
          )),
        );
      });
}
