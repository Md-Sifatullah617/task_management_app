import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task_management_app/style/style.dart';
import '../utility/utilities.dart';

AppBar taskAppBar(context, profileDetails) {
  final double width = MediaQuery.of(context).size.width;
  var avatar = profileDetails['photo'];
  if (avatar == '') {
    avatar = defaultProfilePic;
  }
  return AppBar(
    backgroundColor: colorGreen,
    flexibleSpace: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(top: width * 0.04),
        child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/updateProfile");
            },
            child: ListTile(
                leading: ClipOval(
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: Image.memory(
                      showimage64(avatar),
                      fit: BoxFit.cover,
                    ),
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
