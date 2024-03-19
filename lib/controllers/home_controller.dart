import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  String profileUrl = 'assets/profile/profile.png';
  String name = FirebaseAuth.instance.currentUser?.displayName ?? 'User Name';
}
