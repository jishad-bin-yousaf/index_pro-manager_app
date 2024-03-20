import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:index_pro/controllers/account_controller.dart';

import 'widgets/custom_widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AccountController c = Get.put(AccountController());
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/ellipse_login.png'),
          scale: 5,
          alignment: Alignment.topRight,
        )),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 120),
                    child: Text("Sign in",
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ))),
                CustomWidgets.customDivider(theme),
              ],
            ),
            Text(
              "Free tools to sky-rocket your creative freedom image generator",
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.outline),
            ),
            const SizedBox(height: 70),
            TextField(
              controller: c.emailController,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: theme.colorScheme.secondaryContainer,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.mail_outline),
                  prefixIconColor: theme.colorScheme.primary,
                  label: const Text("Email")),
            ),
            const SizedBox(height: 20),
            Obx(() => TextField(
                  controller: c.passwordController,
                  obscureText: c.hidePassKey.isTrue,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: theme.colorScheme.secondaryContainer,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(Icons.lock_open_rounded),
                      prefixIconColor: theme.colorScheme.primary,
                      suffixIcon: IconButton(
                        icon: c.hidePassKey.isTrue ? const Icon(Icons.visibility_outlined) : const Icon(Icons.visibility_off_outlined),
                        onPressed: () => c.hidePassKey.value = !c.hidePassKey.value,
                      ),
                      suffixIconColor: theme.colorScheme.primary,
                      label: const Text("Password")),
                )),
            Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  style: TextButton.styleFrom(foregroundColor: theme.colorScheme.inverseSurface),
                  child: const Text('Forgot password?'),
                  onPressed: () => c.onForgetPassword(),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: FilledButton(
                  style: FilledButton.styleFrom(
                    fixedSize: const Size(double.maxFinite, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => c.onSignIn(),
                  child: const Text("Sign in")),
            ),
            const Center(
              child: Text("Don't have an account?"),
            ),
            Center(
              child: TextButton(
                child: const Text("Sign up"),
                onPressed: () => c.onSignUp(),
              ),
            )
          ],
        ),
      )),
    );
  }
}
