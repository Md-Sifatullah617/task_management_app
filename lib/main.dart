import 'package:flutter/material.dart';
import 'package:task_management_app/screen/onboarding/email_verification_screen.dart';
import 'package:task_management_app/screen/onboarding/login_screen.dart';
import 'package:task_management_app/screen/onboarding/pin_verification_screen.dart';
import 'package:task_management_app/screen/onboarding/registration_screen.dart';
import 'package:task_management_app/screen/onboarding/set_password_screen.dart';
import 'package:task_management_app/screen/onboarding/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/registration',
      routes: {
        '/':(context)=> const SplashScreen(),
        '/login':(context)=> const LoginScreen(),
        '/registration':(context)=> const RegistrationScreen(),
        '/emailVerification':(context)=> const EmailVerificationScreen(),
        '/pinVerification':(context)=> const PinVerificationScreen(),
        '/setPwd':(context)=> const SetPwdScreen(),
      },
    );
  }
}

