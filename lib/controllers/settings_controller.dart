import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  String name = '';
  String email = '';

  String profileUrl = '';
  @override
  void onInit() {
    FirebaseAuth.instance.currentUser?.displayName;
    name = FirebaseAuth.instance.currentUser?.displayName ?? 'User Name';
    email = FirebaseAuth.instance.currentUser?.email ?? 'username@gmail.com';
    profileUrl = 'assets/profile/profile.png';
    super.onInit();
  }

  onEdit() {}

  onChangePassword() {}

  onAppSettingsClicked() {}
}
