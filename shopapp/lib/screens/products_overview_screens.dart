import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/cart.dart';
import 'package:shopapp/screens/cart_screen.dart';
import 'package:shopapp/widgets/app_drawer.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../providers/product_provider.dart';

enum FilterOptions { Fav, All }

class ProductOverview extends StatefulWidget {
  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  bool _showOnlyFav = false;
  bool _isInit = true;
  @override
  void initState() {
    // Provider.of<Products>(context).fetchAndSetProduct(); //wont work
    // Future.delayed(Duration.zero).then((value) {
    //   Provider.of<Products>(context).fetchAndSetProduct();
    // });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<Products>(context).fetchAndSetProduct();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

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

                // print(selectedValue);
              },
              icon: const Icon(Icons.more_vert),
              itemBuilder: (_) => const [
                    PopupMenuItem(
                      value: FilterOptions.Fav,
                      child: Text('Only fav'),
                    ),
                    PopupMenuItem(
                      value: FilterOptions.All,
                      child: Text('show all'),
                    ),
                  ]),
          Consumer<Cart>(
              builder: (_, cartdata, ch) => Badge(
                    value: cartdata.itemCount.toString(),
                    child: ch as Widget,
                  ),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              )),
        ],
      ),
      drawer: const AppDrawer(),
      body: productGrid(showFavorite: _showOnlyFav),
    );
  }
}
