import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_management_app/api/api_client.dart';

import '../../style/style.dart';
import '../../utility/utilities.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({super.key});

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  final emailCtrl = TextEditingController();
  final fnameCtrl = TextEditingController();
  final lnameCtrl = TextEditingController();
  final mobileCtrl = TextEditingController();
  final pwdCtrl = TextEditingController();
  bool loading = false;
  XFile? pickedImage;
  String? base64Image;

  formOnSubmit() async {
    Map<String, String> formValues = {
      "firstName": fnameCtrl.text,
      "lastName": lnameCtrl.text,
      "mobile": mobileCtrl.text.trim(),
    };
    if (pickedImage != null) {
      List<int> imageBytes = await pickedImage!.readAsBytes();
      base64Image = base64Encode(imageBytes);
      formValues['photo'] = base64Image ?? "";
    }
    if (pwdCtrl.text.isNotEmpty) {
      formValues['password'] = pwdCtrl.text;
    }
    setState(() {
      loading = true;
    });

    bool res = await updateProfile(formValues);
    if (res == true) {
      updateValues('photo', base64Image!);
      updateValues('firstName', fnameCtrl.text);
      updateValues('lastName', lnameCtrl.text);
      updateValues('mobile', mobileCtrl.text);
      //navigate to dashboard
      Navigator.pushNamedAndRemoveUntil(context, "/mainPage", (route) => false);
    }
  }

  pickImage() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Select profile picture"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () async {
                    pickedImage = await ImagePicker()
                        .pickImage(source: ImageSource.camera);
                    if (pickedImage != null) {
                      setState(() {});
                    }
                    Navigator.pop(context);
                  },
                  leading: const Icon(Icons.camera_alt_outlined),
                  title: const Text('Camera'),
                ),
                ListTile(
                  onTap: () async {
                    pickedImage = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (pickedImage != null) {
                      setState(() {});
                    }
                    Navigator.pop(context);
                  },
                  leading: const Icon(Icons.photo_album_outlined),
                  title: const Text('Gallery'),
                )
              ],
            ),
          );
        });
  }

  callStoredData() async {
    String? email = await readUserData("email");
    String? fName = await readUserData("firstName");
    String? lName = await readUserData("lastName");
    String? mobile = await readUserData("mobile");
    String? pwd = await readUserData("savedPassword");
    String? pp = await readUserData("photo");
    setState(() {
      emailCtrl.text = email.toString();
      fnameCtrl.text = fName.toString();
      lnameCtrl.text = lName.toString();
      mobileCtrl.text = mobile.toString();
      pwdCtrl.text = pwd.toString();
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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            screenBackground(context),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 60, 0, 0),
              padding: const EdgeInsets.all(30.0),
              child: loading
                  ? const Center(child: (CircularProgressIndicator()))
                  : (Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Update Profile",
                          style: head1Text(colorDarkBlue),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            pickImage();
                          },
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: const BoxDecoration(
                                    color: colorLightGray,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10))),
                                child: const Text("Photo"),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: const BoxDecoration(
                                      color: colorWhite,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10))),
                                  child: Text(
                                    pickedImage?.name ?? "",
                                    maxLines: 1,
                                    style: const TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          readOnly: true,
                          controller: emailCtrl,
                          decoration: appInputDecoration("Email Address"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: fnameCtrl,
                          decoration: appInputDecoration("First Name"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: lnameCtrl,
                          decoration: appInputDecoration("Last Name"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: mobileCtrl,
                          decoration: appInputDecoration("Mobile"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: pwdCtrl,
                          obscureText: true,
                          decoration: appInputDecoration("Password"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              formOnSubmit();
                            },
                            style: appButtonStyle(),
                            child: successButtonChild("Update")),
                      ],
                    )),
            ),
          ],
        ),
      ),
    );
  }
}
