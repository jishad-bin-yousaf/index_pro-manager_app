import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:index_pro/Models/home.dart';

class FireBaseFunctions {
  final _db = FirebaseFirestore.instance;
  Future<List<TransactionModel>> getTransactions() async {
    final collection = await _db.collection('transaction').get();
    return collection.docs.map((doc) => TransactionModel.fromMap(doc.id, doc.data())).toList();
  }
}
