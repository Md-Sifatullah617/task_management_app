import 'package:flutter/material.dart';
import 'package:task_management_app/style/style.dart';

import '../../api/api_client.dart';

class TaskCreateScreen extends StatefulWidget {
  const TaskCreateScreen({Key? key}) : super(key: key);

  @override
  State<TaskCreateScreen> createState() => _TaskCreateScreenState();
}

class _TaskCreateScreenState extends State<TaskCreateScreen> {
  Map<String, String> formValues = {
    "title": "",
    "description": "",
    "status": "New"
  };
  bool loading = false;

  inputOnChanged(mapKey, textValue) {
    setState(() {
      formValues.update(mapKey, (value) => textValue);
    });
  }

  formOnSubmit() async {
    if (formValues['title']!.isEmpty) {
      errorToast("Title Required !");
    } else if (formValues['description']!.isEmpty) {
      errorToast("Description Requred !");
    } else {
      setState(() {
        loading = true;
      });
      bool res = await taskCreateRequest(formValues);
      if (res == true) {
        Navigator.pushNamedAndRemoveUntil(
            context, "/mainPage", (route) => false);
      } else {
        setState(() {
          loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: colorGreen, title: const Text("Create New Task")),
      body: SingleChildScrollView(
        child: Stack(alignment: Alignment.topCenter, children: [
          screenBackground(
            context,
          ),
          Container(
            alignment: Alignment.topCenter,
            child: loading
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Add New Task",
                          style: head1Text(colorDarkBlue),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: appInputDecoration("Task Name"),
                          onChanged: (textValue) {
                            inputOnChanged("title", textValue);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: appInputDecoration("Description"),
                          maxLines: 10,
                          onChanged: (textValue) {
                            inputOnChanged("description", textValue);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              formOnSubmit();
                            },
                            style: appButtonStyle(),
                            child: successButtonChild("Create"))
                      ],
                    ),
                  ),
          )
        ]),
      ),
    );
  }
}
