import 'package:flutter/material.dart';
import '../widgets/products_grid.dart';
import 'package:shopapp/providers/product_provider.dart';
import 'package:provider/provider.dart';

enum FilterOptions { Fav, All }

class ProductOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productcontroller = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MyShop',
        ),
        actions: [
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                if (selectedValue == FilterOptions.All) {
                  productcontroller.showAll();
                } else {
                  productcontroller.shoFav();
                }

                print(selectedValue);
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text('Only fav'),
                      value: FilterOptions.Fav,
                    ),
                    PopupMenuItem(
                      child: Text('show all'),
                      value: FilterOptions.All,
                    ),
                  ])
        ],
      ),
      body: productGrid(),
    );
  }
}
