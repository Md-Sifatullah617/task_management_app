import 'package:get/get.dart';

import 'controller/task_controller.dart';
import 'pages.dart';

class AppRoutes {
  static const String splash = '/';
  static const String mainPage = '/mainPage';
  static const String login = '/login';
  static const String registration = '/registration';
  static const String emailVerification = '/emailVerification';
  static const String pinVerification = '/pinVerification';
  static const String setPwd = '/setPwd';
  static const String taskCreate = '/taskCreate';
  static const String updateProfile = '/updateProfile';

  static final List<GetPage> pages = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(
        name: mainPage,
        page: () => const MyHomePage(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => TaskController());
        })),
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: registration, page: () => const RegistrationScreen()),
    GetPage(
        name: emailVerification, page: () => const EmailVerificationScreen()),
    GetPage(name: pinVerification, page: () => const PinVerificationScreen()),
    GetPage(name: setPwd, page: () => const SetPwdScreen()),
    GetPage(name: taskCreate, page: () => const TaskCreateScreen()),
    GetPage(name: updateProfile, page: () => const ProfileUpdateScreen()),
  ];
}
