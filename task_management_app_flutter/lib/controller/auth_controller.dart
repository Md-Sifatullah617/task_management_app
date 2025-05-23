import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:task_management_app_client/task_management_app_client.dart';
import 'package:task_management_app_flutter/routes.dart';

import '../main.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  final authController = EmailAuthController(client.modules.auth);

  Future<void> registerAccount({required User user}) async {
    isLoading.value = true;
    try {
      debugPrint("Registering account with ${user.toJson()}");
      // Call your API or perform registration logic here
      final result = await authController.createAccountRequest(
          "${user.firstName} ${user.lastName}", user.email, user.password);

      if (result == true) {
        // Registration successful
        Get.offNamed(AppRoutes.pinVerification);
      } else {
        // Handle registration failure
        Get.snackbar(
          "Registration Failed",
          "Please check your information and try again.",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
        );
      }
    } catch (e) {
      // Handle exceptions (network errors, server errors, etc.)
      Get.snackbar(
        "Registration Error",
        "Error: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5),
      );
      print("Registration error: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loginAccount({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;
    try {
      // Call your API or perform login logic here
      final result = await authController.signIn(email, password);
      if (result != null) {
        // Login successful
        Get.offNamed(AppRoutes.mainPage); // Navigate to the main page
      } else {
        // Handle login failure
        Get.snackbar(
          "Login Failed",
          "Invalid email or password. Please try again.",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
        );
      }
    } catch (e) {
      // Handle exceptions
      Get.snackbar(
        "Login Error",
        "Error: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5),
      );
      print("Login error: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> sentOtp({
    required String email,
  }) async {
    isLoading.value = true;
    try {
      // Call your API or perform OTP logic here
      final result = await authController.initiatePasswordReset(email);
      if (result == true) {
        // OTP sent successfully
        Get.snackbar(
          "OTP Sent",
          "Verification code has been sent to your email.",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
        );
        Get.offNamed(AppRoutes.emailVerification, arguments: {'email': email});
      } else {
        // Handle OTP sending failure
        Get.snackbar(
          "Error",
          "Failed to send verification code. Please try again.",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
        );
      }
    } catch (e) {
      // Handle exceptions
      Get.snackbar(
        "Error",
        "Error: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5),
      );
      print("OTP sending error: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> verifyOtp({
    required String email,
    required String password,
    required String code,
  }) async {
    isLoading.value = true;
    try {
      // Call your API or perform OTP verification logic here
      final result = await authController.resetPassword(email, code, password);
      if (result == true) {
        // Password reset successful
        Get.snackbar(
          "Success",
          "Password has been reset successfully.",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
        );
        Get.offNamed(AppRoutes.login);
      } else {
        // Handle verification failure
        Get.snackbar(
          "Verification Failed",
          "Invalid code or expired. Please try again.",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
        );
      }
    } catch (e) {
      // Handle exceptions
      Get.snackbar(
        "Error",
        "Error: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5),
      );
      print("OTP verification error: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }
}
