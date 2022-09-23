import 'package:flutter/material.dart';

class Transaction {
  String id;
  String Title;
  double amount;
  DateTime date;

  Transaction({
    required this.id,
    required this.Title,
    required this.amount,
    required this.date,
  });
}
