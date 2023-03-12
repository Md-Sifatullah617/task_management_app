import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_management_app/api/api_client.dart';

class NewTaskList extends StatefulWidget {
  const NewTaskList({Key? key}) : super(key: key);

  @override
  State<NewTaskList> createState() => _NewTaskListState();
}

class _NewTaskListState extends State<NewTaskList> {
  List taskItems = [];
  bool loading = true;

  @override
  initState() {
    super.initState();
    callData();
  }

  callData() async {
    var data = await taskLIstRequest("New");
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
        : const Center(child: Text("new task"));
  }
}
