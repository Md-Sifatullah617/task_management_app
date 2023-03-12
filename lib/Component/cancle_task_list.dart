import 'package:flutter/material.dart';

import '../api/api_client.dart';

class CancelTaskList extends StatefulWidget {
  const CancelTaskList({Key? key}) : super(key: key);

  @override
  State<CancelTaskList> createState() => _CancelTaskListState();
}

class _CancelTaskListState extends State<CancelTaskList> {
    List taskItems = [];
  bool loading = true;

  @override
  initState() {
    super.initState();
    callData();
  }

  callData() async {
    var data = await taskLIstRequest("canceled");
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
        : const Center(child: Text("canceled task"));
  }
}
