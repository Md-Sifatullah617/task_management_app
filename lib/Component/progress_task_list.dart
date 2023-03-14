import 'package:flutter/material.dart';
import 'package:task_management_app/Component/tast_list.dart';

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
    var data = await taskLIstRequest("Progress");
    setState(() {
      loading = false;
      taskItems = data;
    });
  }


  deleteItems(id) async{
    showDialog(context: context, builder: (context){
        return AlertDialog(
            title: const Text("Delete"),
            content: const Text("Once delete, you can't get it back"),
            actions: [
                OutlinedButton(onPressed: () async {
                    Navigator.pop(context);
                    setState(() {
                      loading=true;
                    });
                    await deleteTaskRequest(id);
                    await callData();
                }, child: const Text("Yes")),
                OutlinedButton(onPressed: (){
                    Navigator.pop(context);
                }, child: const Text("No")),
            ],
        );
    });
  }
  @override
  Widget build(BuildContext context) {
    return loading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : RefreshIndicator(
            onRefresh: () async {
              await callData();
            },
            child: taskList(taskItems, deleteItems));
  }
}
