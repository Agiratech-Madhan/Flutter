import 'package:expense_app/models/transaction.dart';
import 'package:expense_app/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  Chart(this.recentTransaction);
  // const Chart({super.key});
  List<Map<String, Object>> get groupTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totsum = 0.0;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          totsum += recentTransaction[i].amount;
        }
      }
      print("weekday${weekDay.day}");
      // print("recent off0 ${recentTransaction[0].date.day}");
      print(DateFormat.E().format(weekDay));
      print(totsum);
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totsum,
      };
    }).reversed.toList()
        // .reversed.toList() ---- for reverse
        ;
  }

  double get totspending {
    return groupTransaction.fold(0.0, (previousValue, item) {
      return previousValue + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupTransaction);
    print("totspending${totspending}");
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: groupTransaction.map((e) {
            // return Text('${e['day']}:${e['amount']}');

            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  e['day'] as String,
                  e['amount'] as double,
                  totspending == 0.0
                      ? 0.0
                      : (e['amount'] as double) / totspending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
