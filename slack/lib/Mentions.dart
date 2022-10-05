import 'package:flutter/material.dart';

class Mentions extends StatefulWidget {
  const Mentions({super.key});

  @override
  State<Mentions> createState() => _MentionsState();
}

class _MentionsState extends State<Mentions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Mentions"),
    );
  }
}
