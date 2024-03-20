import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Models/home.dart';
import '../data/firebase_functions.dart';

class ReportController extends GetxController {
  List<TransactionModel> dataList = [];
  List<TransactionModel> filteredDataList = [];
  DateTime fromDate = DateTime.now().subtract(const Duration(days: 365));
  DateTime toDate = DateTime.now();
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  @override
  void onInit() {
    fromDateController.text = DateFormat('dd-MMM-yy').format(fromDate);
    toDateController.text = DateFormat('dd-MMM-yy').format(toDate);
    FireBaseFunctions().getTransactions().then((value) {
      dataList = value;
      filteredDataList.assignAll(_filterDataList());
      update(['data', true]);
    });

    super.onInit();
  }

  onSearch() {
    filteredDataList.assignAll(_filterDataList());
    update(['data', true]);
  }

  List<TransactionModel> _filterDataList() {
    final list = dataList.where((element) => element.createdDate!.isAfter(fromDate.subtract(const Duration(days: 1))) && element.createdDate!.isBefore(toDate.add(Duration(days: 1)))).toList();
    log(list.length.toString());
    final filteredList = [
      ...list,
    ];

    return filteredList.toSet().toList();
  }
}
