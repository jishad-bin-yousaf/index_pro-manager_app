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
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Get.snackbar("Can't sign up", 'The password provided is too weak', snackPosition: SnackPosition.BOTTOM, backgroundColor: Theme.of(Get.context!).colorScheme.errorContainer);
        } else if (e.code == 'email-already-in-use') {
          Get.snackbar('Please login', 'The account already exists for that email.', snackPosition: SnackPosition.BOTTOM, backgroundColor: Theme.of(Get.context!).colorScheme.errorContainer);
        }
      } catch (e) {
        log('$e');
      }
    } else {
      Get.snackbar('Invalid Sign Up', 'please Enter username and password', snackPosition: SnackPosition.BOTTOM, backgroundColor: Theme.of(Get.context!).colorScheme.errorContainer);
    }
  }
}
