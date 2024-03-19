import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:responsive_framework/responsive_framework.dart';

import 'View/home_screen.dart';
import 'view/login_screen.dart';
import 'config/color_schemes.dart';
import 'config/text_theme.dart';
import 'firebase_options.dart';
import 'view/pending_screen.dart';
import 'view/reports_screen.dart';
import 'view/settings_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Index Pro - Manager App',
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme, textTheme: textTheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme, textTheme: textTheme),
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return const LayoutScreen();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return const LoginScreen();
        },
      ),
    );
  }
}

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bodyScreens = [
      const HomeScreen(),
      const PendingScreen(),
      const ReportScreen(),
      const SettingsScreen(),
    ];
    _LayoutController c = Get.put(_LayoutController());
    final theme = Theme.of(context);
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     TextButton(
      //         onPressed: () {
      //           FirebaseAuth.instance.signOut();
      //         },
      //         child: const Text('Logout'))
      //   ],
      // ),
      body: Obx(() => bodyScreens[c.currentIndex.value]),
      bottomNavigationBar: SafeArea(
        child: Obx(() => Card(
              elevation: 8,
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: BottomNavigationBar(
                  unselectedItemColor: theme.colorScheme.outline,
                  selectedItemColor: theme.colorScheme.primary,
                  showUnselectedLabels: true,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.cached_outlined),
                      label: 'Pending',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.stacked_bar_chart_outlined),
                      label: 'Reports',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings_outlined),
                      label: 'Settings',
                    ),
                  ],
                  currentIndex: c.currentIndex.value,
                  onTap: (value) => c.currentIndex.value = value,
                ),
              ),
            )),
      ),
    );
  }
}

class _LayoutController extends GetxController {
  RxInt currentIndex = (0).obs;
}
