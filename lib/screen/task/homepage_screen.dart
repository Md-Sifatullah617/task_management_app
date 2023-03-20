import 'package:flutter/material.dart';
import 'package:task_management_app/Component/bottom_app_bar.dart';
import 'package:task_management_app/Component/cancle_task_list.dart';
import 'package:task_management_app/Component/comleted_task_list.dart';
import 'package:task_management_app/Component/new_task_list.dart';
import 'package:task_management_app/Component/progress_task_list.dart';
import 'package:task_management_app/Component/task_app_bar.dart';
import 'package:task_management_app/utility/utilities.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int bottomTabIndex = 0;
  onTappedIndexChange(int index) {
    setState(() {
      bottomTabIndex = index;
    });
  }

  final widgetOptions = [
    const NewTaskList(),
    const ProgressTaskList(),
    const CompletedTaskList(),
    const CancelTaskList()
  ];
  Map<String, String> profileDetails = {
    "firstName": "",
    "lastName": "",
    "email": "",
    "photo": "",
  };

  callStoredData() async {
    String? email = await readUserData("email");
    String? fName = await readUserData("firstName");
    String? lName = await readUserData("lastName");
    String? pp = await readUserData("photo");
    setState(() {
      profileDetails = {
        "firstName": "$fName",
        "lastName": "$lName",
        "email": "$email",
        "photo": "$pp",
      };
    });
  }

  @override
  void initState() {
    super.initState();
    callStoredData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: taskAppBar(context, profileDetails),
      body: widgetOptions.elementAt(bottomTabIndex),
      bottomNavigationBar: appBottomNav(bottomTabIndex, onTappedIndexChange),
    );
  }
}
