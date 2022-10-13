// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Card(
            shadowColor: Colors.pink,
            elevation: 10,
            surfaceTintColor: Colors.black,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.deepPurpleAccent, //<-- SEE HERE
              ),
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            ),
            semanticContainer: true,

            // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: InkWell(
              splashColor: Color.fromARGB(255, 77, 131, 176).withAlpha(30),
              onTap: () {
                debugPrint('Card tapped.');
              },
              child: const SizedBox(
                width: 300,
                height: 100,
                child: Text('A card that can be tapped'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
