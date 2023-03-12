import 'package:flutter/material.dart';

import '../api/api_client.dart';

class ProgressTaskList extends StatefulWidget {
  const ProgressTaskList({Key? key}) : super(key: key);

  @override
  State<ProgressTaskList> createState() => _ProgressTaskListState();
}

class _ProgressTaskListState extends State<ProgressTaskList> {
    List taskItems = [];
  bool loading = true;

  @override
  initState() {
    super.initState();
    callData();
  }

  callData() async {
    var data = await taskLIstRequest("progress");
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
        : const Center(child: Text("progress task"));
  }
}
