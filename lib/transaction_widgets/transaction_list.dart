import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String delId) deleteTrxn;
  const TransactionList(this.transactions, this.deleteTrxn, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TransactionItem(
          id: transactions[index].id,
          title: transactions[index].title,
          amount: transactions[index].amount,
          date: transactions[index].date,
          deleteTrxn: deleteTrxn,
        );
      },
      itemCount: transactions.length,
    );
  }
}
