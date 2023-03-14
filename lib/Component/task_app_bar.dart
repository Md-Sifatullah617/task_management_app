import 'package:flutter/material.dart';
import 'package:task_management_app/style/style.dart';
import '../utility/utilities.dart';

AppBar taskAppBar(context, profileDetails) {
  return AppBar(
    backgroundColor: colorGreen,
    flexibleSpace: Container(
      margin: const EdgeInsets.only(left: 10, top: 40, right: 0, bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 24,
              child: ClipOval(
                  child:
                      Image.memory(showBase64Image(profileDetails["photo"])))),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 32,
              ),
              Text(
                "${profileDetails["firstName"]} ${profileDetails["lastName"]}",
                style: head7Text(colorWhite),
              ),
              Text(
                "${profileDetails["email"]}",
                style: head9Text(colorWhite),
              )
            ],
          )
        ],
      ),
    ),
    actions: [
      IconButton(onPressed: () {
        Navigator.pushNamed(context, '/taskCreate');
      }, icon: const Icon(Icons.add_circle_outline)),
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
