import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool hidePassKey = true.obs;

  onForgetPassword() {}

  onSignIn() async {
    if (emailController.text.isNotEmpty && passwordController.text.length >= 6) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
      } catch (e) {
        Get.snackbar('Invalid login', 'Please check Email / Password', snackPosition: SnackPosition.BOTTOM, backgroundColor: Theme.of(Get.context!).colorScheme.errorContainer);
      }
    } else {
      Get.snackbar('Invalid login', 'please Enter username and password', snackPosition: SnackPosition.BOTTOM, backgroundColor: Theme.of(Get.context!).colorScheme.errorContainer);
    }
  }

  onSignUp() async {
    if (emailController.text.isNotEmpty && passwordController.text.length >= 6) {
    } else {
      Get.snackbar('Invalid Sign Up', 'please Enter username and password', snackPosition: SnackPosition.BOTTOM, backgroundColor: Theme.of(Get.context!).colorScheme.errorContainer);
    }
  }
}
