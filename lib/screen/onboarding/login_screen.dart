import 'package:flutter/material.dart';
import 'package:task_management_app/api/api_client.dart';
import 'package:task_management_app/style/style.dart';

import '../../utility/utilities.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Map<String, String> formValues = {"email": "", "password": ""};
  bool loading = false;

  inputOnChanged(mapKey, textValue) {
    setState(() {
      formValues.update(mapKey, (value) => textValue);
    });
  }

  formOnSubmit() async {
    if (formValues["email"]!.isEmpty) {
      errorToast("Email Required !");
    } else if (formValues["password"]!.isEmpty) {
      errorToast("Password Required !");
    } else {
      setState(() {
        loading = true;
      });
    //Store password on sharedpreferences
    //   await AuthDetails.writePassword(formValues["password"]);
      bool res = await loginRequest(formValues);
      if (res == true) {
        //navigate to dashboard
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
      body: Stack(
        children: [
          screenBackground(context),
          Container(
            alignment: Alignment.center,
            child: loading
                ? (const Center(child: (CircularProgressIndicator())))
                : (SingleChildScrollView(
                    child: Container(
                        alignment: Alignment.center,
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Get Started With",
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
                            decoration: appInputDecoration("Email Address"),
                            onChanged: (textValue) {
                              inputOnChanged("email", textValue);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            decoration: appInputDecoration("Password"),
                            onChanged: (textValue) {
                              inputOnChanged("password", textValue);
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
                              child: successButtonChild("Login")),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/emailVerification');
                                  },
                                  child: Text(
                                    "Forget Password?",
                                    style: head7Text(colorLightGray),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Don't have a account?",
                                      style: head7Text(colorDarkBlue),
                                    ),
                                    const SizedBox(width: 5,),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, "/registration");
                                      },
                                      child: Text(
                                        "Sign Up",
                                        style: head7Text(colorGreen),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
          )
        ],
      ),
    );
  }
}
