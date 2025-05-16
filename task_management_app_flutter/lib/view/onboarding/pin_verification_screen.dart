import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../api/api_client.dart';
import '../../style/style.dart';
import '../../utility/utilities.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  Map<String, String> formValues = {"OTP": ""};
  bool loading = false;

  inputOnChanged(mapKey, textValue) {
    setState(() {
      formValues.update(mapKey, (value) => textValue);
    });
  }

  formOnSubmit() async {
    if (formValues['OTP']!.length != 6) {
      customToast(isError: true, "OTP Required (6 digit) !");
    } else {
      setState(() {
        loading = true;
      });
      String? emailAddress = await readUserData("email");
      bool res = await verifyOTPRequest(emailAddress, formValues['OTP']);
      if (res == true) {
        Navigator.pushNamed(context, '/setPwd');
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
                  "Pin Verification",
                  style: head1Text(colorDarkBlue),
                ),
                const SizedBox(
                  height: 1,
                ),
                Text(
                  "A 6 digit verification pin has been sent to your mobile number",
                  style: head6Text(colorLightGray),
                ),
                const SizedBox(
                  height: 20,
                ),
                PinCodeTextField(
                    appContext: context,
                    length: 6,
                    pinTheme: appOTPStyle(),
                    animationType: AnimationType.fade,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    onCompleted: (v) {
                      print("Completed");
                    },
                    onChanged: (value) {
                      inputOnChanged("OTP", value);
                    }),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      formOnSubmit();
                    },
                    style: appButtonStyle(),
                    child: successButtonChild("Verify")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
