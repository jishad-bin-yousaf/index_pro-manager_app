import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:index_pro/controllers/account_controller.dart';

import 'widgets/custom_widgets.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    AccountController c = Get.put(AccountController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton.filled(
          style: IconButton.styleFrom(padding: const EdgeInsets.only(left: 5)),
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios, color: theme.colorScheme.background),
        ),
      ),
      resizeToAvoidBottomInset: false,
      bottomSheet: Container(
        height: 60,
        width: double.maxFinite,
        margin: const EdgeInsets.all(20),
        child: FilledButton(
          onPressed: () => Get.back(),
          style: FilledButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), backgroundColor: theme.colorScheme.primary),
          child: Text(
            'Reset Password',
            style: theme.textTheme.labelLarge?.copyWith(
              color: theme.colorScheme.background,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text("Change Password",
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
            controller: c.newPasswordController,
            obscureText: true,
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
                label: const Text("New Password")),
          ),
          const SizedBox(height: 20),
          Obx(() => TextField(
                controller: c.confirmNewPasswordController,
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
                    label: const Text("Confirm New Password")),
              )),
        ],
      ),
    );
  }
}
