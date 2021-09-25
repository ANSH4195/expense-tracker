import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class AddTransaction extends StatelessWidget {
  final List<Transaction> transactions;
  AddTransaction(this.transactions, {Key? key}) : super(key: key);

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      margin: EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Add Transaction',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                style: TextButton.styleFrom(primary: Colors.purpleAccent),
              ),
            )
          ],
        ),
      ),
    );
  }
}