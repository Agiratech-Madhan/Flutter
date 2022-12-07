// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(widget.index.toString()),
      ),
    );
  }
}
