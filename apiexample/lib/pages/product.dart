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

    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'ID:                                       ${productData.productData!.id}'),
            Text(
                'FirstImage ID:                  ${productData.productData!.images![0].id}'),
            Text(
                'FirstImage ImageName:  ${productData.productData!.images![0].imageName}'),
            Text(
                'SecondImage ID:             ${productData.productData!.images![1].id}'),
            Text(
                'SecondImage ImageName:  ${productData.productData!.images![1].imageName}'),
          ],
        ),
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