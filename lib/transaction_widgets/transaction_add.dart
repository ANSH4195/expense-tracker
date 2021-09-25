import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddTransaction extends StatefulWidget {
  final void Function(String title, int amount) addTransaction;
  AddTransaction(this.addTransaction, {Key? key}) : super(key: key);

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void addHandler() {
    final title = titleController.text;
    final amount =
        amountController.text.isEmpty ? 0 : int.parse(amountController.text);

    if (title.isEmpty || amount <= 0) {
      return;
    }

    widget.addTransaction(title, amount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleController,
            onSubmitted: (_) => addHandler(),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => addHandler(),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: TextButton(
              onPressed: addHandler,
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              style: TextButton.styleFrom(
                primary: Colors.purpleAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
