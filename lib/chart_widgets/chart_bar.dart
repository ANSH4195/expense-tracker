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
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return LayoutBuilder(builder: (ctx, constraints) {
      final height = constraints.maxHeight;
      final width = constraints.maxWidth;
      return isPortrait
          ? Column(
              children: [
                SizedBox(
                  height: height * 0.12,
                  child: FittedBox(
                    child: Text(
                      '₹$spent',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.05),
                SizedBox(
                  height: height * 0.66,
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
                SizedBox(height: height * 0.05),
                SizedBox(
                  height: height * 0.12,
                  child: FittedBox(
                    child: Text(
                      label,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Row(
              children: [
                SizedBox(
                  width: width * 0.12,
                  child: FittedBox(
                    child: Text(
                      label,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: width * 0.05),
                SizedBox(
                  width: width * 0.66,
                  height: 20,
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
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
                        widthFactor: spentPercentage,
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
                SizedBox(width: width * 0.05),
                SizedBox(
                  width: width * 0.12,
                  child: FittedBox(
                    child: Text(
                      '₹$spent',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            );
    });
  }
}
