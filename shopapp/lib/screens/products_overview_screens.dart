import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/cart.dart';
import 'package:shopapp/screens/cart_screen.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';

enum FilterOptions { Fav, All }

class ProductOverview extends StatefulWidget {
  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  var _showOnlyFav = false;
  @override
  Widget build(BuildContext context) {
    // final productcontroller = Provider.of<Products>(context, listen: false);

    // final cart=Provider.of<Cart>(context) ;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MyShop',
        ),
        actions: [
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.All) {
                    // productcontroller.showAll();
                    _showOnlyFav = false;
                  } else {
                    // productcontroller.shoFav();
                    _showOnlyFav = true;
                  }
                });

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
                  ]),
          Consumer<Cart>(
              builder: (_, cartdata, ch) => Badge(
                  child: ch as Widget, value: cartdata.itemCount.toString()),
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              )),
        ],
      ),
      body: productGrid(showFavorite: _showOnlyFav),
    );
  }
}
