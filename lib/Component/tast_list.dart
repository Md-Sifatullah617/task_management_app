import 'package:flutter/material.dart';
import '../style/style.dart';

ListView taskList(taskItems) {
  return ListView.builder(
      itemCount: taskItems.length,
      itemBuilder: (context, index) {
        return Card(
            child: containerCard(
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(taskItems[index]['title'], style: head1Text(colorDarkBlue),),
                        Text(taskItems[index]['description'], style: head7Text(colorLightGray),),
                    ],
                )
            ),
        );
      });
}
