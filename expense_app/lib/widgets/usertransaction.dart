// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import './newtransaction.dart';
import './transactionlist.dart';
import '../models/transaction.dart';

class Usertranasaction extends StatefulWidget {
  const Usertranasaction({super.key});

  @override
  State<Usertranasaction> createState() => _UsertranasactionState();
}

class _UsertranasactionState extends State<Usertranasaction> {
  List<Transaction> _userTransaction = [
    Transaction(id: '101', Title: 'food', amount: 89, date: DateTime.now()),
    Transaction(id: '102', Title: 'travel', amount: 65, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        newTransaction(),
        TransactionList(_userTransaction),
      ],
    );
  }
}
