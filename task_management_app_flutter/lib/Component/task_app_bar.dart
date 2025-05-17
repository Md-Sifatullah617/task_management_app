import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app_flutter/routes.dart';

import '../main.dart';
import '../style/style.dart';
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
            Get.toNamed(AppRoutes.taskCreate);
          },
          icon: const Icon(Icons.add_circle_outline)),
      IconButton(
          onPressed: () async {
            await sessionManager.signOutDevice().then((value) async {
              debugPrint("Sign out device: $value");
              await removeToken();
              Get.offAllNamed(AppRoutes.login);
            });
          },
          icon: const Icon(Icons.exit_to_app))
    ],
  );
}
