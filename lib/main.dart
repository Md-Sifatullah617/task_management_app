import 'package:flutter/material.dart';
import 'package:task_management_app/screen/onboarding/email_verification_screen.dart';
import 'package:task_management_app/screen/onboarding/login_screen.dart';
import 'package:task_management_app/screen/onboarding/pin_verification_screen.dart';
import 'package:task_management_app/screen/onboarding/registration_screen.dart';
import 'package:task_management_app/screen/onboarding/set_password_screen.dart';
import 'package:task_management_app/screen/onboarding/splash_screen.dart';
import 'package:task_management_app/screen/profile/profile_update_screen.dart';
import 'package:task_management_app/screen/task/homepage_screen.dart';
import 'package:task_management_app/screen/task/task_create_screen.dart';

main() {
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
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/mainPage': (context) => const MyHomePage(),
        '/login': (context) => const LoginScreen(),
        '/registration': (context) => const RegistrationScreen(),
        '/emailVerification': (context) => const EmailVerificationScreen(),
        '/pinVerification': (context) => const PinVerificationScreen(),
        '/setPwd': (context) => const SetPwdScreen(),
        '/taskCreate': (context) => const TaskCreateScreen(),
        '/updateProfile': (context) => const ProfileUpdateScreen(),
      },
    );
  }
}
