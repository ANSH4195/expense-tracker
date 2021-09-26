import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final String title;
  final int amount;
  final DateTime date;
  const TransactionItem({
    Key? key,
    required this.title,
    required this.amount,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(
                    DateFormat('EEEE, MMMM d, y').format(date),
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
            Container(
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
          ],
        ),
      ),
    );
  }
}
