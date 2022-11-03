import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Stacks extends StatefulWidget {
  const Stacks({super.key});

  @override
  State<Stacks> createState() => _StacksState();
}

class _StacksState extends State<Stacks> {
  bool sam = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            children: [
              ListTile(
                leading: SizedBox(
                  width: (!true) ? 50 : 30,
                  height: (!true) ? 50 : 30,
                  child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.bottomRight,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset('assets/images/person1.jpeg'),
                        ),
                        if (false)
                          Positioned(
                            bottom: -2,
                            right: -2,
                            child: Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(25),
                                border:
                                    Border.all(width: 3, color: Colors.white),
                              ),
                            ),
                          ),
                        if (true)
                          Positioned(
                            top: 10,
                            left: 10,
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child:
                                    Image.asset('assets/images/person1.jpeg'),
                              ),
                            ),
                          )
                      ]),
                ),
                title: Text("Madhan"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
