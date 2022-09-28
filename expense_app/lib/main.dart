import 'dart:io';
import 'package:expense_app/widgets/chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'widgets/newtransaction.dart';
import 'widgets/transactionlist.dart';
// import 'package:expense_app/widgets/usertransaction.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';
import './widgets/chart.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

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

  bool _enableChart = false;
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
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    final dynamic appBar_ = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: const Text("expense App"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: const Icon(CupertinoIcons.add),
                  onTap: () => _startAddNewtransaction(context),
                )
              ],
            ),
          )
        : AppBar(
            title: const Text(
              'Flutter App',
              style: TextStyle(fontFamily: 'Open Sans'),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => _startAddNewtransaction(context),
              )
            ],
          );
    final tranlistwidget = Container(
        height: (mediaQuery.size.height -
                appBar_.preferredSize.height -
                mediaQuery.padding.top) *
            0.7,
        child: TransactionList(_userTransaction, _deleteTransaction));
    final pageBody =
        // MainAxisAlignment _mainAxisAlignment=MainAxisAlignment.spaceAround,
        SafeArea(
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Enable Chart",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Switch.adaptive(
                      activeColor: Theme.of(context).primaryColor,
                      value: _enableChart,
                      onChanged: (val) {
                        setState(() {
                          _enableChart = val;
                        });
                      })
                ],
              ),

            if (!isLandscape)
              Container(
                  height: (mediaQuery.size.height -
                          appBar_.preferredSize.height -
                          mediaQuery.padding.top) *
                      0.3,
                  child: Chart(
                      _recentTranasactions)), // needs only recent tranasaction
            if (!isLandscape) tranlistwidget,
            if (isLandscape)
              _enableChart
                  ? Container(
                      height: (mediaQuery.size.height -
                              appBar_.preferredSize.height -
                              mediaQuery.padding.top) *
                          0.7,
                      child: Chart(
                          _recentTranasactions)) // needs only recent tranasaction
                  // Usertranasaction(),
                  : tranlistwidget,

            // Card(
            //   child: Text("body"),
            // )
          ],
        ),
      ),
    );
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
            navigationBar: appBar_,
          )
        : Scaffold(
            appBar: appBar_,
            body: pageBody,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    onPressed: () => _startAddNewtransaction(context),
                    child: Icon(Icons.add),
                  ),
          );
  }
}
