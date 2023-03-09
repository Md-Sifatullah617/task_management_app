import 'package:flutter/material.dart';
import 'package:task_management_app/style/style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Map<String, String> formValues = {"email": "", "password": ""};
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          screenBackground(context),
          Padding(
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
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: appInputDecoration("Password"),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: appButtonStyle(),
                    child: successButtonChild("Login")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
