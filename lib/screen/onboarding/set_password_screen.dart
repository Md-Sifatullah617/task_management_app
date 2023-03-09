import 'package:flutter/material.dart';

import '../../style/style.dart';

class SetPwdScreen extends StatefulWidget {
  const SetPwdScreen({Key? key}) : super(key: key);

  @override
  State<SetPwdScreen> createState() => _SetPwdScreenState();
}

class _SetPwdScreenState extends State<SetPwdScreen> {
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
                Text("Set Password", style: head1Text(colorDarkBlue),),
                const SizedBox(height: 1,),
                Text("Minimum length password 8 character with latter and number combination", style: head6Text(colorLightGray),),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: appInputDecoration("Password"),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: appInputDecoration("Confirm Password"),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(onPressed: (){},
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
