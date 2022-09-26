import 'package:expense_app/widgets/chart.dart';

import 'widgets/newtransaction.dart';
import 'widgets/transactionlist.dart';
// import 'package:expense_app/widgets/usertransaction.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';

import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        // colorScheme: ColorScheme(Color primary: Colors.amber,),
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        // colorScheme = ColorScheme.fromSeed(seedColor: colorSchemeSeed, brightness: effectiveBrightness);

        // colorSchemeSeed:  Color(123),
        // colorScheme: ,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: TextTheme(
            headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        // appBarTheme: AppBarTheme(
        //     toolbarTextStyle: TextStyle(
        //         fontFamily: 'OpenSans',
        //         fontSize: 30,
        //         fontWeight: FontWeight.bold)),
        appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
                // color: Colors.lightBlueAccent,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 20)),
        errorColor: Colors.red,
        // appBarTheme: AppBarTheme(toolbarTextStyle: ThemeData.light())
        // appBarTheme: AppBarTheme(
        //   too: TextTheme(
        //     headline6: TextStyle(
        //         fontFamily: 'OpenSans',
        //         fontSize: 20,
        //         fontWeight: FontWeight.bold)),
        // ),
      ),
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
    // Transaction(id: '101', Title: 'food', amount: 89, date: DateTime.now()),
    // Transaction(id: '102', Title: 'travel', amount: 65, date: DateTime.now()),
  ];
  List<Transaction> get _recentTranasactions {
    return _userTransaction.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  // List<Transaction> get _rt{
  //   return _userTransaction.where((e){
  //     return e.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
  //   })
  // }
  void _addNewTransaction(String title_, double amount_, dynamic selecteddate) {
    final newTran = Transaction(
      Title: title_,
      amount: amount_,
      date: selecteddate,
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransaction.add(newTran);
    });
  }

  // DateTime x;
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

  void _deleteTransaction(String id) {
    setState(() {
      _userTransaction.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter App',
          style: TextStyle(fontFamily: 'Open Sans'),
        ),
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
            Chart(_recentTranasactions), // needs only recent tranasaction
            // Usertranasaction(),
            TransactionList(_userTransaction, _deleteTransaction),

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
