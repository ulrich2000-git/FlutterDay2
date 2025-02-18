import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionProvider with changeNotifier {
  double totalBalance = 6,190.00;
  
  List<Transaction> transaction = [
    Transaction(name: "Miraldie", amount: 1190.00, date: DateTime(2025, 1, 22), avatar: "assets/miraldie.png"),

    Transaction(name: "Emeric", amount: -75.00, date: DateTime(2025, 1, 21), avatar: "assets/emeric.png"),

    Transaction(name: "Nelly", amount: -220.00, date: DateTime(2025, 1, 20), avatar: "assets/nelly.png"),

    Transaction(name: "Silas", amount: 2000.00, date: DateTime(2025, 1, 19), avatar: "assets/silas.png"),
  ];

  void addTransaction(Transaction transaction) {
    transaction.insert(0, transaction);
    totalBalance += transaction.amount;
    notifyListeners();
  }
}