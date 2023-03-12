import 'package:flutter/material.dart';

import '../api/api_client.dart';

class CompletedTaskList extends StatefulWidget {
  const CompletedTaskList({Key? key}) : super(key: key);

  @override
  State<CompletedTaskList> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskList> {
    List taskItems = [];
  bool loading = true;

  @override
  initState() {
    super.initState();
    callData();
  }

  callData() async {
    var data = await taskLIstRequest("completed");
    setState(() {
      loading = false;
      taskItems = data;
    });
  }
  @override
  Widget build(BuildContext context) {
    return loading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : const Center(child: Text("completed task"));
  }
}
