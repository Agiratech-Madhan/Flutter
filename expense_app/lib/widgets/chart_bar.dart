import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  // const ChartBar({super.key});

  final String label;
  final double spentamount;
  final double spentp_tot;

  ChartBar(this.label, this.spentamount, this.spentp_tot);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(child: Text(('\$${spentamount.toStringAsFixed(0)}'))),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                color: Color.fromRGBO(220, 220, 220, 1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            FractionallySizedBox(
              heightFactor: spentp_tot,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ]),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
