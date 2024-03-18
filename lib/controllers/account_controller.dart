import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool hidePassKey = true.obs;

  onForgetPassword() {}

  onSignIn() {}

  onSignUp() {}
}
