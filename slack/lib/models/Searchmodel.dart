// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SearchModel {
  final Widget icon;
  final String value;
  final String example;
  SearchModel({
    required this.icon,
    required this.value,
    required this.example,
  });
}

List<SearchModel> Searchlist = [
  SearchModel(
      icon: Icon(Icons.add_box_outlined),
      value: 'in:',
      example: 'Ex:#project-unicorn'),
  SearchModel(
      icon: Icon(Icons.add_box_outlined),
      value: 'from:',
      example: 'Ex:Zoe Maxwell'),
  SearchModel(
      icon: Icon(Icons.add_box_outlined), value: 'is:', example: 'Ex:saved'),
  SearchModel(
      icon: Icon(Icons.add_box_outlined),
      value: 'after:',
      example: 'Ex:2022-11-03'),
  SearchModel(
      icon: Icon(Icons.add_box_outlined), value: 'to:', example: 'Ex:me'),
];
