import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'dart:io';

class StatusModel {
  final String icon;
  final String text;
  final String time;

  StatusModel({required this.icon, required this.text, required this.time});
}

var parser = EmojiParser();
// parser.get('I :ii: :coffee:');
List<StatusModel> setstatus = [
  // U+1F912
  StatusModel(icon: '\u{1f605}', text: "In at meeting--  ", time: " 1 hour"),
  StatusModel(icon: '\u{1f9c7}', text: "At lunch--  ", time: "1 hour"),
  StatusModel(icon: '\u{1f912}', text: "Out sick  ", time: "Today"),
  StatusModel(icon: '\u{1f3DD}', text: "Vacationing-- ", time: "Don't clear"),
  StatusModel(icon: '\u{1F3E1}', text: "Working remotely- ", time: "Today"),
];
