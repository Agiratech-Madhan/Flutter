import 'package:apiexample/providers/address_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class AddressExample extends StatefulWidget {
  const AddressExample({super.key});

  @override
  State<AddressExample> createState() => _AddressExampleState();
}

class _AddressExampleState extends State<AddressExample> {
  @override
  void initState() {
    Provider.of<AddressProvider>(context, listen: false).getvalues();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final values = Provider.of<AddressProvider>(context);
    return Scaffold(
      body: Center(
        child: Text(values.alist!.streets![0]),
      ),
    );
  }
}
