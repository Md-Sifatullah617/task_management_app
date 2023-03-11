import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTaskList extends StatefulWidget {
  const NewTaskList({Key? key}) : super(key: key);

  @override
  State<NewTaskList> createState() => _NewTaskListState();
}

class _NewTaskListState extends State<NewTaskList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("new task")),
    );
  }
}
