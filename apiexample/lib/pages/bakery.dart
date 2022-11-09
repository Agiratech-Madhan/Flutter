import 'package:apiexample/providers/bakeryProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class BakeryExample extends StatefulWidget {
  const BakeryExample({super.key});

  @override
  State<BakeryExample> createState() => _BakeryExampleState();
}

class _BakeryExampleState extends State<BakeryExample> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<Bakeryprovider>(context, listen: false).getBakeryValues();
  }

  @override
  Widget build(BuildContext context) {
    final BakeryData = Provider.of<Bakeryprovider>(context);
    print(BakeryData.bakeryItems!.name);
    // print(BakeryData.);
    return Scaffold(
      body: Container(
        child: Center(child: Text(BakeryData.BakeryItem!.type.toString())),
      ),
    );
  }
}
