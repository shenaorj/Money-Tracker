import 'package:flutter/material.dart';
import 'package:moneytracker/model/transaction.dart';

class TransactionsProvider extends ChangeNotifier {
  final List<Transaction> _transactions = [
    Transaction(
      type: TransactionType.income, 
      amount: 1000.00, 
      description: 'Salary',
      ),
      Transaction(type: TransactionType.expense,
      amount: -500.00,
      description: 'Rent',
      ),
  ];

  List<Transaction> get transactions => _transactions;

  double getTotalIncome() => _transactions
        .where((transaction) => transaction.type == TransactionType.income)
        .fold(0.0, (sum, transaction) => sum + transaction.amount);

  double getTotalExpenses() => _transactions
        .where((transaction) => transaction.type == TransactionType.expense)
        .fold(0.0, (sum, transaction) => sum + transaction.amount);

  double getBalance() => getTotalIncome() + getTotalExpenses();

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }

}