import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class StackBorder extends StatefulWidget {
  const StackBorder({super.key});

  @override
  State<StackBorder> createState() => _StackBorderState();
}

class _StackBorderState extends State<StackBorder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 50,
        height: 50,
        child: Stack(alignment: Alignment.bottomRight, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset('assets/images/person1.jpeg'),
          ),
          Positioned(
            bottom: -2,
            right: -2,
            child: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(width: 3, color: Colors.white),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
