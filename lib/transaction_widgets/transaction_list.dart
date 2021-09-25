import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList(this.transactions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return TransactionItem(
            title: transactions[index].title,
            amount: transactions[index].amount,
            date: transactions[index].date,
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
