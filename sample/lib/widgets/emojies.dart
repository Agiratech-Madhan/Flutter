import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:io';

class Emojies extends StatefulWidget {
  const Emojies({super.key});

  @override
  State<Emojies> createState() => _EmojiesState();
}

class _EmojiesState extends State<Emojies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('\u{1f605}'),
    );
  }
}
