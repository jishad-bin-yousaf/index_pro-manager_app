import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'widgets/custom_widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            TextField(
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
                    icon: const Icon(Icons.visibility_off_outlined),
                    onPressed: () {},
                  ),
                  suffixIconColor: theme.colorScheme.primary,
                  label: const Text("Password")),
            ),
            Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  style: TextButton.styleFrom(foregroundColor: theme.colorScheme.inverseSurface),
                  child: const Text('Forgot password?'),
                  onPressed: () {},
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
                  onPressed: () {},
                  child: const Text("Sign in")),
            ),
            Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: theme.textTheme.bodyMedium,
                  foregroundColor: theme.colorScheme.outline,
                ),
                onPressed: () {},
                child: const Text("Don't have an account?"),
              ),
            ),
            Center(
              child: TextButton(
                child: const Text("Sign up"),
                onPressed: () {},
              ),
            )
          ],
        ),
      )),
    );
  }
}
