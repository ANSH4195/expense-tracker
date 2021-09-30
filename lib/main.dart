import 'dart:math';

import 'package:flutter/material.dart';

import './chart_widgets/chart_list.dart';
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
          primarySwatch: Colors.deepPurple,
        ).copyWith(
          secondary: Colors.deepPurpleAccent,
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
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
          brightness: Brightness.dark,
        ).copyWith(
          secondary: Colors.deepPurpleAccent,
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
      themeMode: ThemeMode.dark,
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
      amount: 345,
      date: DateTime.now().subtract(Duration(days: 0)),
    ),
    Transaction(
      id: 'HYA599',
      title: "Groceries",
      amount: 425,
      date: DateTime.now().subtract(Duration(days: 2)),
    ),
    Transaction(
      id: 'OIJ932',
      title: "Electricity Bill",
      amount: 550,
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
    Transaction(
      id: 'AEJ564',
      title: "New Shoes",
      amount: 669,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    Transaction(
      id: 'HYA899',
      title: "Groceries",
      amount: 526,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: 'OIJ232',
      title: "Electricity Bill",
      amount: 395,
      date: DateTime.now().subtract(Duration(days: 5)),
    ),
  ];

  List<Transaction> get _lastWeekTransactions {
    return _transactions.where((trx) {
      return trx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addTransaction(String title, int amount, DateTime chosenDate) {
    Random rng = Random();
    int newID = rng.nextInt(9999999) + 1000000;
    final newTrxn = Transaction(
      id: newID.toString(),
      title: title,
      amount: amount,
      date: chosenDate,
    );

    setState(() {
      _transactions.add(newTrxn);
    });
  }

  void _deleteTransaction(String delId) {
    setState(() => _transactions.removeWhere((trx) => trx.id == delId));
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
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final useableHeight = MediaQuery.of(context).size.height -
        kToolbarHeight -
        MediaQuery.of(context).padding.top;
    final useableWidth = MediaQuery.of(context).size.width - 20;
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
        margin: EdgeInsets.all(10),
        child: isPortrait
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: (useableHeight - 20) * 0.25,
                      child: ChartList(_lastWeekTransactions),
                    ),
                    SizedBox(
                      height: (useableHeight - 20) * 0.65,
                      child: TransactionList(_transactions, _deleteTransaction),
                    ),
                  ],
                ),
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: useableWidth * 0.33,
                    child: ChartList(_lastWeekTransactions),
                  ),
                  SizedBox(
                    width: useableWidth * 0.02,
                  ),
                  SizedBox(
                    width: useableWidth * 0.65,
                    child: SizedBox(
                      height: useableHeight * 0.8,
                      child: TransactionList(_transactions, _deleteTransaction),
                    ),
                  ),
                ],
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
