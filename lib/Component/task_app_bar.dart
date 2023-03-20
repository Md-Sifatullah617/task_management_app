import 'package:flutter/material.dart';
import 'package:task_management_app/style/style.dart';
import '../utility/utilities.dart';

AppBar taskAppBar(context, profileDetails) {
  return AppBar(
    backgroundColor: colorGreen,
    flexibleSpace: Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(top: 40),
        child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/updateProfile");
            },
            child: ListTile(
                leading: CircleAvatar(
                  radius: 20,
                  child: ClipOval(
                    child:
                        Text(profileDetails['email'].substring(0,1), style: const TextStyle(fontSize: 30), textAlign: TextAlign.center,)
                  ),
                ),
                title: Text(
                  "${profileDetails['firstName']} ${profileDetails['lastName']}",
                  style: head7Text(colorWhite),
                ),
                subtitle: Text(
                  "${profileDetails["email"]}",
                  style: head9Text(colorWhite),
                )))),
    actions: [
      IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/taskCreate');
          },
          icon: const Icon(Icons.add_circle_outline)),
      IconButton(
          onPressed: () async {
            await removeToken();
            Navigator.pushNamedAndRemoveUntil(
                context, "/login", (route) => false);
          },
          icon: const Icon(Icons.exit_to_app))
    ],
  );
}
