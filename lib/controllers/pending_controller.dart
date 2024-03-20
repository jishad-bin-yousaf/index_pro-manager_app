import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Models/home.dart';
import '../data/firebase_functions.dart';

class PendingController extends GetxController {
  List<TransactionModel> dataList = [];
  List<TransactionModel> filteredDataList = [];
  TextEditingController searchController = TextEditingController();
  @override
  void onInit() {
    FireBaseFunctions().getPendingTransactions().then((value) {
      dataList = value;
      filteredDataList.assignAll(_filterDataList(""));

      update(['data', true]);
    });
    super.onInit();
  }

  onSearch(String value) {
    filteredDataList.assignAll(_filterDataList(value));
    update(['data', true]);
  }

  List<TransactionModel> _filterDataList(String query) {
    final list = dataList.where((element) => (element.trNo ?? '').toLowerCase().contains(query.trim().toLowerCase())).toList();

    final filteredList = [
      ...list,
    ];

    return filteredList.toSet().toList();
  }
}
