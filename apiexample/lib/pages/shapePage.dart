import 'package:apiexample/providers/shapeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShapeExample extends StatefulWidget {
  const ShapeExample({super.key});

  @override
  State<ShapeExample> createState() => _ShapeExampleState();
}

class _ShapeExampleState extends State<ShapeExample> {
  @override
  void initState() {
    Provider.of<ShapeProvider>(context, listen: false).getValues();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ShapeData = Provider.of<ShapeProvider>(context);
    print('Object1${ShapeData.shapeData}');
    return Scaffold(
      body: Column(
        children: [
          Text('${ShapeData.shapeData!.shape_name}'),
          Text('${ShapeData.shapeData!.property!.breadth}'),
          Text('${ShapeData.shapeData!.property!.width}'),
        ],
      ),
    );
  }
}
