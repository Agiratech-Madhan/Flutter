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
    print(BakeryData.bakeryItems!.batters!.btype);
    // print(BakeryData.);
    return Scaffold(
      body: Column(
        children: [
          Card(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ID        :${BakeryData.BakeryItem!.id.toString()}'),
                  Text('Name:${BakeryData.BakeryItem!.name}'),
                  Row(
                    children: [
                      Text('Types:${BakeryData.BakeryItem!.type![0]}'),
                      Text(' ${BakeryData.BakeryItem!.type![1]}'),
                    ],
                  ),
                  Text('PPu:${BakeryData.BakeryItem!.ppu}'),
                  Text('batters:${BakeryData.BakeryItem!.batters!.bid}'),
                  Text('             ${BakeryData.BakeryItem!.batters!.btype}'),
                ],
              )),
        ],
      ),
    );
  }
}
