import 'package:flutter/material.dart';
import 'package:task_management_app/style/style.dart';

class TaskCreateScreen extends StatefulWidget {
  const TaskCreateScreen({Key? key}) : super(key: key);

  @override
  State<TaskCreateScreen> createState() => _TaskCreateScreenState();
}

class _TaskCreateScreenState extends State<TaskCreateScreen> {
  Map<String, String> formValues = {
    "title": "",
    "description": "",
    "status": "New"
  };
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: colorGreen, title: const Text("Create New Task")),
    );
  }
}
