import 'package:flutter/material.dart';
import 'package:task_management_app/screen/onboarding/email_verification_screen.dart';
import 'package:task_management_app/screen/onboarding/login_screen.dart';
import 'package:task_management_app/screen/onboarding/pin_verification_screen.dart';
import 'package:task_management_app/screen/onboarding/registration_screen.dart';
import 'package:task_management_app/screen/onboarding/set_password_screen.dart';
import 'package:task_management_app/screen/onboarding/splash_screen.dart';
import 'package:task_management_app/screen/task/new_task_list_screen.dart';
import 'package:task_management_app/utility/utilities.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? token = await readUserData('token');
  if (token==null) {
    runApp(const MyApp('/login'));
  } else {
    runApp(const MyApp('/newTaskList'));
  }
}

class MyApp extends StatelessWidget {
  final String firstRoute;
  const MyApp(this.firstRoute, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: firstRoute,
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/registration': (context) => const RegistrationScreen(),
        '/emailVerification': (context) => const EmailVerificationScreen(),
        '/pinVerification': (context) => const PinVerificationScreen(),
        '/setPwd': (context) => const SetPwdScreen(),
        '/newTaskList': (context) => const NewTaskScreen(),
      },
    );
  }
}
