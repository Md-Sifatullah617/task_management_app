import 'package:flutter/material.dart';

import '../../style/style.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
                Text("Join With Us", style: head1Text(colorDarkBlue),),
                const SizedBox(height: 1,),
                Text("Learn with esuIT", style: head6Text(colorLightGray),),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: appInputDecoration("Email Address"),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: appInputDecoration("First Name"),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: appInputDecoration("Last Name"),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: appInputDecoration("Mobile"),
                ),
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
                    child: successButtonChild("Registration")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
