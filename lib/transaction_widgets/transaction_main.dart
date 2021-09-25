import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_add.dart';
import './transaction_list.dart';

class Transactions extends StatefulWidget {
  Transactions({Key? key}) : super(key: key);

  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 'AEX564',
      title: "New Shoes",
      amount: 3450,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'HYA599',
      title: "Groceries",
      amount: 1455,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'OIJ932',
      title: "Electricity Bill",
      amount: 550,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddTransaction(_transactions),
        TransactionList(_transactions),
      ],
    );
  }
}
