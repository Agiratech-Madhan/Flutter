import 'package:apiexample/providers/productProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductExample extends StatefulWidget {
  const ProductExample({super.key});

  @override
  State<ProductExample> createState() => _ProductExampleState();
}

class _ProductExampleState extends State<ProductExample> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).getValues();
  }

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    print('object${productData}');
    print('object${productData.productData!.id}');
    print('object${productData.productData!.name}');
    print('object${productData.productData!.images}');
    print('object${productData.productData!.images![0]}');
    print('object${productData.productData!.images![0]}');
    print('object${productData.productData!.images![0].id}');
    print('object${productData.productData!.images![0].imageName}');

    return const Scaffold(
      body: Center(
        child: Text('data'),
      ),
    );
  }
}
/**{
    "id":1,
    "name":"ProductName",
    "images":[
      {
        "id":11,
        "imageName":"xCh-rhy"
      },
      {
        "id":31,
        "imageName":"fjs-eun"
      }
    ]
} */