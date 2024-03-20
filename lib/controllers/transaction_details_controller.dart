import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../Models/home.dart';

class TransactionDetailsController extends GetxController {
  RxBool isButtonEnabled = false.obs;

  TransactionDetailsController({required this.data});
  final TransactionModel data;
  String currentStatus = '';
  RxBool showStatusSelection = false.obs;
  TextEditingController commentController = TextEditingController();
  @override
  void onInit() {
    currentStatus = data.status ?? '';
    super.onInit();
  }

  onStatusSelected(String status) {
    currentStatus = status;
    showStatusSelection.value = false;
    isButtonEnabled.value = true;
  }
}
