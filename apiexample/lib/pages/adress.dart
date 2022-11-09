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
    super.initState();
    Provider.of<AddressProvider>(context, listen: false).getAddressValues();
    Provider.of<AddressProvider>(context, listen: false).getAddressesValues();
  }

  @override
  Widget build(BuildContext context) {
    final address = Provider.of<AddressProvider>(context);
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.2,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    alignment: Alignment.center,
                    width: 100,
                    color: Colors.black54,
                    child: Text(address.alist!.city.toString())),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(address.alist!.streets![0]),
                    Text(address.alist!.streets![1])
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
