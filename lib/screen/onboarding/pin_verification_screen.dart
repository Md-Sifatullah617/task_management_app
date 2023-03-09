import 'package:flutter/material.dart';

import '../../style/style.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({Key? key}) : super(key: key);

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
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
                Text("Pin Verification", style: head1Text(colorDarkBlue),),
                const SizedBox(height: 1,),
                Text("A 6 digit verification code ", style: head6Text(colorLightGray),),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: appInputDecoration("Email Address"),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: appInputDecoration("Password"),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(onPressed: (){},
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
