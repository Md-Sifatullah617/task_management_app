import 'package:flutter/material.dart';
import 'package:task_management_app/api/api_client.dart';
import 'package:task_management_app/utility/utilities.dart';

import '../../style/style.dart';

class SetPwdScreen extends StatefulWidget {
  const SetPwdScreen({Key? key}) : super(key: key);

  @override
  State<SetPwdScreen> createState() => _SetPwdScreenState();
}

class _SetPwdScreenState extends State<SetPwdScreen> {
  Map<String, String> formValues = {
    "email": "",
    "OTP": "",
    "password": "",
    "cpassword": ""
  };
  bool loading = false;

  @override
  initState() {
    super.initState();
    callStoreData();
  }

  callStoreData() async {
    String? oTP = await readUserData("OTPVerification");
    String? email = await readUserData("email");
    inputOnChanged("email", email);
    inputOnChanged("OTP", oTP);
  }

  inputOnChanged(mapKey, textValue) {
    setState(() {
      formValues.update(mapKey, (value) => textValue);
    });
  }

  formOnSubmit() async {
    if (formValues['password']!.isEmpty) {
      errorToast("OTP Required (6 digit) !");
    } else if (formValues['cpassword'] != formValues['password']) {
      errorToast('Password should be same !');
    } else {
      setState(() {
        loading = true;
      });
      bool res = await setPwdRequest(formValues);
      if (res == true) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/login', ((route) => false));
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
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Set Password",
                  style: head1Text(colorDarkBlue),
                ),
                const SizedBox(
                  height: 1,
                ),
                Text(
                  "Minimum length password 8 character with latter and number combination",
                  style: head6Text(colorLightGray),
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
                TextFormField(
                  decoration: appInputDecoration("Confirm Password"),
                  onChanged: (textValue) {
                    inputOnChanged("cpassword", textValue);
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
                    child: successButtonChild("Confirm")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
