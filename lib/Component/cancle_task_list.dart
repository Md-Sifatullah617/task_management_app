import 'package:flutter/material.dart';

class CancelTaskList extends StatefulWidget {
  const CancelTaskList({Key? key}) : super(key: key);

  @override
  State<CancelTaskList> createState() => _CancelTaskListState();
}

class _CancelTaskListState extends State<CancelTaskList> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
body: Center(child: Text("cancle")),
    );
  }
}
