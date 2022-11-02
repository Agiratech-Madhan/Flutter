import 'package:flutter/material.dart';

class FutureExample extends StatefulWidget {
  const FutureExample({super.key});

  @override
  State<FutureExample> createState() => _FutureExampleState();
}

class _FutureExampleState extends State<FutureExample> {
  Future<int> getData() async {
    await Future.delayed(Duration(seconds: 4));
// data

    //  throw 7;
    return 7;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(' Future Builder'),
        ), // AppBar
        body: FutureBuilder(
            future: getData(),
            builder: ((context, snapshot) {
              if (snapshot.hasError) {
                final error = snapshot.error;
                return Center(child: Text('error mesage$error'));
              }
              if (snapshot.hasData) {
                int x = snapshot.data!;
                return Center(child: Text('$x'));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            })) // Center
        ); // ;
  }
}


/** 
//when the FAb pressed it does not reload the entire page it just reload the api only that' why we are using the instance of future value
import 'package:http/http.dart' as http;
import 'dart:convert';

class FutureExample extends StatefulWidget {
  const FutureExample({super.key});

  @override
  State<FutureExample> createState() => _FutureExampleState();
}

class _FutureExampleState extends State<FutureExample> {
  Future<int> getData() async {
    final result = await http.get(
      Uri.parse('https://randomnumberapi.com/api/v1.0/random'),
    );
    final body = json.decode(result.body);
    int randomNumber = (body as List).first;
    return randomNumber;
  }

  Future<int>? dataFuture;
  @override
  void initState() {
    super.initState();
    dataFuture = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(' Future Builder'),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.local_fire_department_sharp),
            onPressed: () => setState(() {
                  dataFuture = getData();
                })), // AppBar
        body: FutureBuilder(
            future: dataFuture,
            builder: ((context, snapshot) {
              if (snapshot.hasError) //data !=null
              {
                final error = snapshot.error;
                return Center(child: Text('error mesage$error'));
              } else if (snapshot.hasData) {
                int x = snapshot.data!;
                return Center(child: Text('$x'));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            })) // Center
        ); // ;
  }
}
*//**
import 'package:http/http.dart' as http;
import 'dart:convert';

class FutureExample extends StatefulWidget {
  const FutureExample({super.key});

  @override
  State<FutureExample> createState() => _FutureExampleState();
}

class _FutureExampleState extends State<FutureExample> {
  Future<int> getData() async {
    final result = await http.get(
      Uri.parse('https://randomnumberapi.com/api/v1.0/random'),
    );
    final body = json.decode(result.body);
    int randomNumber = (body as List).first;
    return randomNumber;
  }

  Future<int>? dataFuture;
  @override
  void initState() {
    super.initState();
    dataFuture = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(' Future Builder'),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.local_fire_department_sharp),
            onPressed: () => setState(() {
                  dataFuture = getData();
                })), // AppBar
        body: FutureBuilder(
            future: dataFuture,
            initialData: 5,
            builder: ((context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Text('waiting ${snapshot.data} ${snapshot.error}');
                default:
                  if (snapshot.hasError) //data !=null
                  {
                    final error = snapshot.error;
                    return Center(child: Text('error mesage$error'));
                  } else if (snapshot.hasData) {
                    int x = snapshot.data!;
                    return Center(child: Text('$x'));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
              }
            })) // Center
        ); // ;
  }
}
 */