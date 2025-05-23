import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:task_management_app_client/task_management_app_client.dart';
import 'package:task_management_app_flutter/controller/auth_controller.dart';

import '../../style/style.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // Map<String, String> formValues = {
  //   "email": "",
  //   "firstName": "",
  //   "lastName": "",
  //   "mobile": "",
  //   "password": "",
  //   "photo": "",
  //   "cpassword": ""
  // };
  // bool loading = false;
  // inputOnChanged(mapKey, textValue) {
  //   setState(() {
  //     formValues.update(mapKey, (value) => textValue);
  //   });
  // }

  // formOnSubmit() async {
  //   if (formValues["email"]!.isEmpty) {
  //     customToast(isError: true, "Email Required !");
  //   } else if (formValues["firstName"]!.isEmpty) {
  //     customToast(isError: true, "First Name Required !");
  //   } else if (formValues["lastName"]!.isEmpty) {
  //     customToast(isError: true, "Last Name Required !");
  //   } else if (formValues["mobile"]!.isEmpty) {
  //     customToast(isError: true, "Mobile Number Required !");
  //   } else if (formValues["password"]!.isEmpty) {
  //     customToast(isError: true, "Password Required !");
  //   } else if (formValues["cpassword"] != formValues["password"]) {
  //     customToast(isError: true, "Confirm Password Should Be Same !");
  //   } else {
  //     setState(() {
  //       loading = true;
  //     });
  //     bool res = await authController.createAccountRequest(userName, email, password);

  //     if (res == true) {
  //       Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
  //     } else {
  //       setState(() {
  //         loading = false;
  //       });
  //     }
  //   }
  // }
  final AuthController controller = Get.find<AuthController>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cpasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              child: Form(
                key: _formKey,
                child: Column(
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
                      controller: emailController,
                      onChanged: (textValue) {
                        emailController.text = textValue;
                      },
                      decoration: appInputDecoration("Email Address"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: firstNameController,
                      onChanged: (textValue) {
                        firstNameController.text = textValue;
                      },
                      decoration: appInputDecoration("First Name"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: lastNameController,
                      onChanged: (textValue) {
                        lastNameController.text = textValue;
                      },
                      decoration: appInputDecoration("Last Name"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: mobileController,
                      onChanged: (textValue) {
                        mobileController.text = textValue;
                      },
                      decoration: appInputDecoration("Mobile"),
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please enter your mobile number';
                      //   }
                      //   if (!RegExp(r'^\d{11}$').hasMatch(value)) {
                      //     return 'Please enter a valid mobile number';
                      //   }
                      //   return null;
                      // },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passwordController,
                      onChanged: (textValue) {
                        passwordController.text = textValue;
                      },
                      decoration: appInputDecoration("Password"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: cpasswordController,
                      onChanged: (textValue) {
                        cpasswordController.text = textValue;
                      },
                      decoration: appInputDecoration("Confirm Password"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => controller.isLoading.value
                          ? const Center(
                              child: (SpinKitSpinningLines(
                                color: colorGreen,
                              )),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  controller.registerAccount(
                                      user: User(
                                    email: emailController.text,
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    phone: mobileController.text,
                                    password: passwordController.text,
                                  ));
                                }
                              },
                              style: appButtonStyle(),
                              child: successButtonChild("Registration")),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
