import 'package:flutter/material.dart';
import 'package:task_management_app/api/api_client.dart';
import 'package:task_management_app/utility/utilities.dart';

import '../../style/style.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  Map<String, String> formValues = {
    "email": "",
    "firstName": "",
    "lastName": "",
    "mobile": "",
    "password": "",
    "photo": "",
    "cpassword": ""
  };
  bool loading = false;
  inputOnChanged(mapKey, textValue) {
    setState(() {
      formValues.update(mapKey, (value) => textValue);
    });
  }

  formOnSubmit() async {
    Navigator.pushNamedAndRemoveUntil(
        context, "/emailVerification", (route) => false);
    if (formValues["email"]!.isEmpty) {
      errorToast("Email Required !");
    } else if (formValues["firstName"]!.isEmpty) {
      errorToast("First Name Required !");
    } else if (formValues["lastName"]!.isEmpty) {
      errorToast("Last Name Required !");
    } else if (formValues["mobile"]!.isEmpty) {
      errorToast("Mobile Number Required !");
    } else if (formValues["password"]!.isEmpty) {
      errorToast("Password Required !");
    } else if (formValues["cpassword"] != formValues["password"]) {
      errorToast("Confirm Password Should Be Same !");
    } else {
      setState(() {
        loading = true;
      });
      bool res = await registrationRequest(formValues);

      if (res == true) {
        Navigator.pushNamedAndRemoveUntil(
            context, "/emailVerification", (route) => false);
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
                          "Join With Us",
                          style: head1Text(colorDarkBlue),
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        Text(
                          "Learn with esuIT",
                          style: head6Text(colorLightGray),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onChanged: (textValue) {
                            inputOnChanged("email", textValue);
                          },
                          decoration: appInputDecoration("Email Address"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onChanged: (textValue) {
                            inputOnChanged("firstName", textValue);
                          },
                          decoration: appInputDecoration("First Name"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onChanged: (textValue) {
                            inputOnChanged("lastName", textValue);
                          },
                          decoration: appInputDecoration("Last Name"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onChanged: (textValue) {
                            inputOnChanged("mobile", textValue);
                          },
                          decoration: appInputDecoration("Mobile"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onChanged: (textValue) {
                            inputOnChanged("password", textValue);
                          },
                          decoration: appInputDecoration("Password"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onChanged: (textValue) {
                            inputOnChanged("cpassword", textValue);
                          },
                          decoration: appInputDecoration("Confirm Password"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              formOnSubmit();
                            },
                            style: appButtonStyle(),
                            child: successButtonChild("Registration")),
                      ],
                    )),
            ),
          ],
        ),
      ),
    );
  }
}
