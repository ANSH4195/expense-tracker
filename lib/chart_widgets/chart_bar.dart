import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final int spent;
  final double spentPercentage;
  const ChartBar(
      {Key? key,
      required this.label,
      required this.spent,
      required this.spentPercentage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          child: Text(
            '₹$spent',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 4),
        SizedBox(
          height: 60,
          width: 20,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.orangeAccent,
                    width: 1,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spentPercentage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
