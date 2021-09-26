import 'dart:math';

import 'package:flutter/material.dart';

import './chart.dart';
import './models/transaction.dart';
import './transaction_widgets/transaction_add.dart';
import './transaction_widgets/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.purple,
        ).copyWith(
          secondary: Colors.purpleAccent,
        ),
        fontFamily: 'FiraSans',
        textTheme: ThemeData.light().textTheme.copyWith(
              caption: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
              bodyText1: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
              bodyText2: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      home: MyHomePage(title: 'Expense Manager'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void _addTransaction(String title, int amount) {
    Random rng = Random();
    int newID = rng.nextInt(9999999) + 1000000;
    final newTrxn = Transaction(
      id: newID.toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTrxn);
    });
  }

  void _showAddModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return AddTransaction(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () => _showAddModal(context),
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Chart(),
              TransactionList(_transactions),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton.icon(
        icon: Icon(Icons.add),
        label: Text('Add'),
        onPressed: () => _showAddModal(context),
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).colorScheme.secondary,
          fixedSize: Size(100, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
