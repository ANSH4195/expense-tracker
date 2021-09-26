import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './chart_bar.dart';

class ChartList extends StatelessWidget {
  final List<Transaction> recentTransactions;
  const ChartList(this.recentTransactions, {Key? key}) : super(key: key);

  List<Map<String, Object>> get chartValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      int daySum = 0;
      for (var trx in recentTransactions) {
        if (DateFormat.yMd().format(trx.date) ==
            DateFormat.yMd().format(weekDay)) {
          daySum += trx.amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': daySum,
      };
    });
  }

  int get totalSpendings {
    return chartValues.fold(
      0,
      (previousValue, trx) => previousValue + (trx['amount'] as int),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.secondary,
      margin: EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              'Past Week Spendings',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Divider(
              color: Colors.white70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: chartValues.map((trx) {
                final percent = (trx['amount'] as int) / totalSpendings;
                return Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(
                    label: (trx['day'] as String),
                    spent: (trx['amount'] as int),
                    spentPercentage: percent,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
