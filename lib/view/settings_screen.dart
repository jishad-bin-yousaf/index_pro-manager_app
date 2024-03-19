import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:index_pro/controllers/settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    SettingsController c = Get.put(SettingsController());

    return Scaffold(
      body: Column(
        children: [
          header(c, theme),
          Card(
            color: theme.colorScheme.secondaryContainer,
            elevation: 0,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: ListTile(
              leading: Icon(Icons.lock_open_rounded, color: theme.colorScheme.primary),
              title: const Text('Change Password'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => c.onChangePassword(),
            ),
          ),
          Card(
            elevation: 0,
            color: theme.colorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: ListTile(
              leading: Icon(Icons.account_balance_outlined, color: theme.colorScheme.primary),
              title: const Text('App Settings'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => c.onAppSettingsClicked(),
            ),
          ),
          Card(
            elevation: 0,
            color: theme.colorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: ListTile(
              leading: Icon(Icons.logout_outlined, color: theme.colorScheme.primary),
              title: const Text('Logout'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => FirebaseAuth.instance.signOut(),
            ),
          ),
        ],
      ),
    );
  }

  Container header(SettingsController c, ThemeData theme) {
    return Container(
        width: double.maxFinite,
        height: 300,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              Color.fromARGB(255, 0, 139, 113),
              Color(0xFF006B57),
              Color.fromARGB(255, 0, 139, 113),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () => c.onEdit(),
                child: Container(
                  height: 35,
                  width: 35,
                  padding: const EdgeInsets.all(7),
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(color: theme.colorScheme.background, borderRadius: BorderRadius.circular(12)),
                  child: Image.asset(
                    'assets/profile/edit_icon.png',
                  ),
                ),
              ),
            ),
            CircleAvatar(
              radius: 50,
              backgroundColor: theme.colorScheme.background,
              foregroundImage: AssetImage(c.profileUrl),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text(
                c.name,
                style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.background),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.email_outlined,
                  color: theme.colorScheme.background,
                ),
                Text(
                  ' ${c.email}',
                  style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.background),
                )
              ],
            )
          ],
        ));
  }
}
