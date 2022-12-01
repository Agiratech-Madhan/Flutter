import 'package:flutter/material.dart';
import '../routes/routes.dart' as route;

class FifthPage extends StatefulWidget {
  const FifthPage({super.key});
  @override
  State<FifthPage> createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage> {
  final List<int> items = List<int>.generate(50, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('FifthPage'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(route.sixthPage);
              },
              icon: const Icon(Icons.arrow_forward))
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text('data')
          RichText(
              text: const TextSpan(children: [
            TextSpan(text: 'Madhan', style: TextStyle(color: Colors.black)),
            TextSpan(
                text: ' Madhan ',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            TextSpan(text: 'Madhan', style: TextStyle(color: Colors.black)),
          ])),
          const Expanded(
              flex: 0,
              child: AspectRatio(
                aspectRatio: 0.5 / 0.5,
                child: Card(color: Colors.pink, child: Text('AspectRatio')),
              )),
          Expanded(
            child: ListView(
              children: [
                LimitedBox(
                  maxHeight: 120,
                  child: Column(
                    children: [
                      for (int i = 0; i < 5; i++)
                        const Text(
                          'Limited Box ',
                          style: TextStyle(
                              color: Colors.black,
                              backgroundColor: Colors.green),
                        )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
