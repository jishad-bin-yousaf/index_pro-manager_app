import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 120),
                    child: Text("Sign in",
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ))),
                customDivider(theme),
              ],
            )
          ],
        ),
      )),
    );
  }
}

Container customDivider(ThemeData theme) {
  return Container(
    width: 40,
    height: 5,
    decoration: BoxDecoration(
      color: theme.colorScheme.primary,
      borderRadius: BorderRadius.circular(5),
    ),
    margin: const EdgeInsets.only(top: 5, left: 8),
  );
}
