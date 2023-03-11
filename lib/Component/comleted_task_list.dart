import 'package:flutter/material.dart';

class CompletedTaskList extends StatefulWidget {
  const CompletedTaskList({Key? key}) : super(key: key);

  @override
  State<CompletedTaskList> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Center(child: Text("completed")),
    );
  }
}
