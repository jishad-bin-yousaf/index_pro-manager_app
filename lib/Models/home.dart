import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionModel {
  final String? id;
  final String? status;
  final String? comments;
  final String? walletId;
  final String? tRate;
  final String? approvedBy;
  final DateTime? createdDate;
  final String? trNo;
  final String? userId;
  final String? tUsdt;
  final DateTime? approvedDate;
  final String? accNo;
  final String? bank;
  final String? ifsc;
  final String? tAmount;
  final String? accName;
  final String? document;

  TransactionModel({
    this.id,
    this.status,
    this.comments,
    this.walletId,
    this.tRate,
    this.approvedBy,
    this.createdDate,
    this.trNo,
    this.userId,
    this.tUsdt,
    this.approvedDate,
    this.accNo,
    this.bank,
    this.ifsc,
    this.tAmount,
    this.accName,
    this.document,
  });

  factory TransactionModel.fromMap(String? id, Map<String?, dynamic> map) {
    return TransactionModel(
      id: id,
      status: map['status'] ?? '',
      comments: map['comments'] ?? '',
      walletId: map['walletId'] ?? '',
      tRate: map['tRate'] ?? 0,
      approvedBy: map['approvedBy'] ?? '',
      createdDate: (map['createdDate'] as Timestamp).toDate(),
      trNo: map['trNo'] ?? 0,
      userId: map['userId'] ?? '',
      tUsdt: map['tUsdt'] ?? 0,
      approvedDate: (map['approvedDate'] as Timestamp).toDate(),
      accNo: map['accNo'] ?? 0,
      bank: map['bank'] ?? '',
      ifsc: map['ifsc'] ?? '',
      tAmount: map['tAmount'] ?? 0.0,
      accName: map['accName'] ?? '',
      document: map['document'] ?? '',
    );
  }
}
