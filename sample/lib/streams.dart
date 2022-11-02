import 'package:flutter/material.dart';

class StreamExample extends StatefulWidget {
  const StreamExample({super.key});

  @override
  State<StreamExample> createState() => _StreamExampleState();
}

/** 
class _StreamExampleState extends State<StreamExample> {
  Stream<int?> getNumbers() async* {
    await Future.delayed(const Duration(seconds: 4));
    yield 1;
    await Future.delayed(const Duration(seconds: 1));
    yield null;
    await Future.delayed(const Duration(seconds: 1));
    yield 3;
    // throw 'error';
  }

  Stream<int?>? numbersStream;
  @override
  void initState() {
    super.initState();
    numbersStream = getNumbers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(' Future Builder'),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.roundabout_left),
            onPressed: (() => setState(() {
                  numbersStream = getNumbers();
                }))), // AppBar
        body: StreamBuilder(
          stream: numbersStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: Text('wait'));
            } else if (snapshot.hasError) {
              return Text('$snapshot.error');
            } else if (snapshot.hasData) {
              int number = snapshot.data!;
              return Center(child: Text('$number'));
            } else {
              return Center(child: Text('data'));
            }
          },
        ) // Center
        ); // ;
  }
}
// connection state . active means once get the first value of the stream 

// stream null and connection state is null
*/
class _StreamExampleState extends State<StreamExample> {
  Stream<int?> getNumbers() async* {
    await Future.delayed(const Duration(seconds: 4));
    yield 1;
    await Future.delayed(const Duration(seconds: 1));
    yield null;
    await Future.delayed(const Duration(seconds: 1));
    yield 3;
    // throw 'error';
  }

  Stream<int?>? numbersStream;
  @override
  void initState() {
    super.initState();
    numbersStream = getNumbers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(' Future Builder'),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.roundabout_left),
            onPressed: (() => setState(() {
                  numbersStream = getNumbers();
                }))), // AppBar
        body: StreamBuilder(
          stream: numbersStream,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
                //  returns firs value return by the stream but not completed
                if (snapshot.hasData) {
                  int number = snapshot.data!;
                  return Center(child: Text('$number'));
                } else {
                  return Text('no error');
                }
              case ConnectionState.waiting:
                return Center(child: Text('wait'));
              //nothing more executed in this method
              case ConnectionState.done:
                if (snapshot.hasData) {
                  int number = snapshot.data!;
                  return Center(child: Text('done'));
                } else {
                  return Text('no data');
                }

              default:
                return Center(child: Text('default state'));
            }
          },
        ) // Center
        ); // ;
  }
}// if (snapshot.connectionState == ConnectionState.waiting) {
             
        