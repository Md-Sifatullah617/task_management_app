import 'package:flutter/material.dart';
import 'package:task_management_app/Component/tast_list.dart';
import 'package:task_management_app/api/api_client.dart';
import 'package:task_management_app/style/style.dart';

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

  deleteItems(id) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Delete"),
            content: const Text("Once delete, you can't get it back"),
            actions: [
              OutlinedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    setState(() {
                      loading = true;
                    });
                    await deleteTaskRequest(id);
                    await callData();
                  },
                  child: const Text("Yes")),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("No")),
            ],
          );
        });
  }

  String status = 'New';
  updateStatus(id) async {
    setState(() {
      loading = true;
    });
    await updateTaskRequest(id, status);
    await callData();
    setState(() {
      status = "New";
    });
  }

  statusChange(id) async {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (constext, StateSetter setState) {
            return Container(
              padding: const EdgeInsets.all(30),
              height: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RadioListTile(
                      title: const Text("New"),
                      value: "New",
                      groupValue: status,
                      onChanged: (value) {
                        setState(() {
                          status = value.toString();
                        });
                      }),
                  RadioListTile(
                      title: const Text("Progress"),
                      value: "Progress",
                      groupValue: status,
                      onChanged: (value) {
                        setState(() {
                          status = value.toString();
                        });
                      }),
                  RadioListTile(
                      title: const Text("Completed"),
                      value: "Completed",
                      groupValue: status,
                      onChanged: (value) {
                        setState(() {
                          status = value.toString();
                        });
                      }),
                  RadioListTile(
                      title: const Text("Canceled"),
                      value: "Canceled",
                      groupValue: status,
                      onChanged: (value) {
                        setState(() {
                          status = value.toString();
                        });
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        Navigator.pop(context);
                        updateStatus(id);
                      },
                      style: appButtonStyle(),
                      child: successButtonChild("Confirm"))
                ],
              ),
            );
          });
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
            child: taskList(taskItems, deleteItems, statusChange));
  }
}
