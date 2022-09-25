import 'package:expense_app/models/transaction.dart';
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
      print("weekday${weekDay}");
      print("recent off0 ${recentTransaction[0].date.day}");
      print(DateFormat.E().format(weekDay));
      print(totsum);
      return {
        'day': DateFormat.E().format(weekDay),
        'amount': totsum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupTransaction);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Row(
        children: [],
      ),
    );
  }
}
