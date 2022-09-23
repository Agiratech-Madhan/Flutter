import 'widgets/newtransaction.dart';
import 'widgets/transactionlist.dart';
// import 'package:expense_app/widgets/usertransaction.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List<Transaction> transaction = [

  final List<Transaction> _userTransaction = [
    Transaction(id: '101', Title: 'food', amount: 89, date: DateTime.now()),
    Transaction(id: '102', Title: 'travel', amount: 65, date: DateTime.now()),
  ];
  void _addNewTransaction(String title_, double amount_) {
    final newTran = Transaction(
      Title: title_,
      amount: amount_,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransaction.add(newTran);
    });
  }

  void _startAddNewtransaction(BuildContext ctex) {
    showModalBottomSheet(
      context: ctex,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewtransaction(context),
          )
        ],
      ),
      body:

          // MainAxisAlignment _mainAxisAlignment=MainAxisAlignment.spaceAround,
          SingleChildScrollView(
        child: Column(
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
            // Usertranasaction(),
            TransactionList(_userTransaction),

            // Card(
            //   child: Text("body"),
            // )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewtransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
