import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_management_app/api/api_client.dart';

import '../../style/style.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({Key? key}) : super(key: key);

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  Map<String, String> formValues = {"otp": ""};
    bool loading = false;

  inputOnChanged(mapKey, textValue) {
    setState(() {
      formValues.update(mapKey, (value) => textValue);
    });
  }

  formOnSubmit() async {
    if (formValues["otp"]!.isEmpty && formValues["otp"]!.length!=6) {
      errorToast("OTP Required (6 digit) !");
    } else {
      setState(() {
        loading = true;
      });
      bool res = await verifyOTPRequest(formValues['email'],formValues['otp']);
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
                    onCompleted: (v) {},
                    onChanged: (value) {}),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {},
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
