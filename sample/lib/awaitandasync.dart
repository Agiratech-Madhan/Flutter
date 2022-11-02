import 'package:flutter/material.dart';

class AsyncAwait extends StatefulWidget {
  const AsyncAwait({super.key});

  @override
  State<AsyncAwait> createState() => _AsyncAwaitState();
}

class _AsyncAwaitState extends State<AsyncAwait> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("await and async example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  /**one
I/flutter (19115): three
I/flutter (19115): future second  after 5 sec value */
                  print('one');
                  Future.delayed(Duration(seconds: 5), () {
                    print('future second  after 5 sec value');
                  });
                  print('three');
                },
                child: Text('one')),
            ElevatedButton(
                onPressed: () async {
                  /**one
I/flutter (19115): future second  after 5 sec value
I/flutter (19115): three */
                  print('one');
                  await Future.delayed(Duration(seconds: 5), () {
                    print('future second  after 5 sec value');
                  });
                  print('three');
                },
                child: Text('Two')),
            ElevatedButton(
                onPressed: () async {
                  print('one');
                  // final msg = getdata();//three  Instance of 'Future<String>'
                  final msg =
                      await getdata(); //I/flutter (19115): three  hello mad

                  print('three  $msg');
                },
                child: Text('three')),
          ],
        ),
      ),
    );
  }

  Future<String> getdata() async {
    await Future.delayed(
      Duration(seconds: 5),
    );
    return 'hello mad';
  }
}
