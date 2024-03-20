import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:index_pro/data/firebase_functions.dart';

import '../Models/home.dart';

class HomeController extends GetxController {
  List<TransactionModel> data = [];
  String profileUrl = 'assets/profile/profile.png';
  String name = FirebaseAuth.instance.currentUser?.displayName ?? 'User Name';
  int pendingCount = 0;
  int successCount = 0;
  int cancelledCount = 0;
  @override
  void onInit() {
    FireBaseFunctions().getTransactions().then((value) {
      data = value;
      pendingCount = value.where((element) => element.status == "Pending").toList().length;
      successCount = value.where((element) => element.status == "Success").toList().length;
      cancelledCount = value.where((element) => element.status == "Cancelled").toList().length;
      update(['data', true]);
    });
    super.onInit();
  }
}
