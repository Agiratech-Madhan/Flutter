import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

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
  String? titleInput;
  String? amtinput;
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
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                        decoration: InputDecoration(labelText: 'text'),
                        onChanged: (value) => titleInput = value),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      onChanged: (value) => amtinput = value,
                    ),
                    TextButton(
                      onPressed: () {
                        print(titleInput);
                        print(amtinput);
                      },
                      child: Text(
                        "Add Transaction",
                        style: TextStyle(color: Colors.purple),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: transaction.map((e) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.purple, width: 2)),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          // e.amount.toString(),
                          '\$${e.amount}',
                          style: TextStyle(
                              color: Colors.purple,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e.Title,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            // e.date.toString(),
                            DateFormat.yMMMd().format(e.date),
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
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
