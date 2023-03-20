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
  List counttask = [];
  int newtaskcount = 0,
      completetaskcount = 0,
      progresstaskcount = 0,
      canceltaskcount = 0;

  List taskItems = [];
  bool loading = true;
  String Status = "New";

  @override
  initState() {
    super.initState();
    callData();
    tastCount();
  }

  tastCount() async {
    var data = await taskCountRequest();
    setState(() {
      counttask = data;
      newtaskcount = 0;
      completetaskcount = 0;
      progresstaskcount = 0;
      canceltaskcount = 0;
      counttask.forEach((element) {
        if (element["_id"] == "New") {
          newtaskcount = element["sum"];
        } else if (element["_id"] == "Completed") {
          completetaskcount = element["sum"];
        } else if (element["_id"] == "Progress") {
          progresstaskcount = element["sum"];
        } else if (element["_id"] == "Canceled") {
          canceltaskcount = element["sum"];
        }
      });
    });
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
            child: Column(
              children: [
                Row(
                  children: [
                    statuscount("New", newtaskcount.toString()),
                    statuscount("Progress", progresstaskcount.toString()),
                    statuscount("Completed", completetaskcount.toString()),
                    statuscount("Canceled", canceltaskcount.toString()),
                  ],
                ),
                Expanded(child: taskList(taskItems, deleteItems, statusChange)),
              ],
            ));
  }
}
