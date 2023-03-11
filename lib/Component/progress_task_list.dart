import 'package:flutter/material.dart';

class ProgressTaskList extends StatefulWidget {
  const ProgressTaskList({Key? key}) : super(key: key);

  @override
  State<ProgressTaskList> createState() => _ProgressTaskListState();
}

class _ProgressTaskListState extends State<ProgressTaskList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Center(child: Text("progress")),
    );
  }
}
