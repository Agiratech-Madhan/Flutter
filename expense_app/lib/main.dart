import 'package:flutter/material.dart';
import './transaction.dart';

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
  List<Transaction> transaction = [
    Transaction(id: '101', Title: 'food', amount: 89, date: DateTime.now()),
    Transaction(id: '102', Title: 'travel', amount: 65, date: DateTime.now()),
  ];

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                elevation: 5, // width: double.infinity,
                color: Colors.blue,
                child: Text('hello chart'),
              ),
            ),
            Column(
              children: transaction.map((e) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        child: Text(e.amount.toString()),
                      ),
                      Column(
                        children: [Text(e.Title), Text(e.date.toString())],
                      )
                    ],
                  ),
                );
              }).toList(),
            ),

            // Card(
            //   child: Text("body"),
            // )
          ],
        ));
  }
}
