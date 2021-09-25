import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList(this.transactions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...transactions.map((t) {
          return TransactionItem(
            title: t.title,
            amount: t.amount,
            date: t.date,
          );
        }).toList()
      ],
    );
  }
}
