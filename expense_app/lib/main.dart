import 'package:expense_app/widgets/newtransaction.dart';
import 'package:expense_app/widgets/transactionlist.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // List<Transaction> transaction = [
  //   Transaction(id: '101', Title: 'food', amount: 89, date: DateTime.now()),
  //   Transaction(id: '102', Title: 'travel', amount: 65, date: DateTime.now()),
  // ];

  // String? titleInput;
  // String? amtinput;
  // final titlecontroller = TextEditingController(); moved into newtransaction.dart
  // final MainAxisAlignment mainAxisAlignment,
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter App'),
        ),
        body:
            // Ma

            // MainAxisAlignment _mainAxisAlignment=MainAxisAlignment.spaceAround,
            Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                elevation: 5, // width: double.infinity,
                color: Colors.blue,
                child: Text('hello chart'),
              ),
            ),

            // Card(
            //   child: Text("body"),
            // )
          ],
        ));
  }
}
