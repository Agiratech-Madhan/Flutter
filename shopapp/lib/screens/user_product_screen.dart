import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/screens/edit_product_screen.dart';
import 'package:shopapp/widgets/user_product_item.dart';
// import 'package:provider/single_child_widget.dart';
// import '../providers/product.dart';
import '../providers/product_provider.dart';
import '../widgets/app_drawer.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';
  final String id = 'c1';
  bool isAdd = true;
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Product'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routeName,
                    arguments: {'id': id, 'isAdd': true});
              },
              icon: const Icon(Icons.add))
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: productsData.items.length,
            itemBuilder: (context, i) => Column(
                  children: [
                    UserProductItem(
                        id: productsData.items[i].id,
                        title: productsData.items[i].title,
                        imgUrl: productsData.items[i].imageUrl),
                    Divider()
                  ],
                )),
      ),
    );
  }
}
