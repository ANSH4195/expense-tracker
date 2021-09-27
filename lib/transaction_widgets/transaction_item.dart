import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final String id;
  final String title;
  final int amount;
  final DateTime date;
  final void Function(String delId) deleteTrxn;
  const TransactionItem({
    Key? key,
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.deleteTrxn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: ListTile(
        leading: IconButton(
          onPressed: () => deleteTrxn(id),
          icon: Icon(Icons.close),
          padding: EdgeInsets.all(6),
          tooltip: 'Remove this transaction',
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        subtitle: Text(
          DateFormat('EEEE, MMM d, y').format(date),
          style: Theme.of(context).textTheme.caption,
        ),
        trailing: Container(
          child: Text(
            '₹ $amount',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            color: Theme.of(context).colorScheme.secondary,
          ),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
      ),
    );
  }
}
