import 'package:flutter/material.dart';
import 'package:task_management_app/api/api_client.dart';

import '../../style/style.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  Map<String, String> formValues = {"email": ""};
  bool loading = false;

  inputOnChanged(mapKey, textValue) {
    setState(() {
      formValues.update(mapKey, (value) => textValue);
    });
  }

  formOnSubmit() async {
    Navigator.pushNamed(context, '/pinVerification');
    if (formValues["email"]!.isEmpty) {
      errorToast("Email Required !");
    } else {
      setState(() {
        loading = true;
      });
      bool res = await verifyEmailRequest(formValues['email']);
      if (res == true) {
        Navigator.pushNamed(context, '/pinVerification');
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
            child: loading
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Email Address",
                        style: head1Text(colorDarkBlue),
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                      Text(
                        "A 6 digit verification pin will be send to your email address",
                        style: head6Text(colorLightGray),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        onChanged: (textValue) {
                          inputOnChanged('email', textValue);
                        },
                        decoration: appInputDecoration("Email Address"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            formOnSubmit();
                          },
                          style: appButtonStyle(),
                          child: successButtonChild("Next")),
                    ],
                  ),
          )
        ],
      ),
    );
  }
}
