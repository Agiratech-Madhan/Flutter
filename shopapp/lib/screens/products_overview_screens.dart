import 'package:flutter/material.dart';
import '../widgets/products_grid.dart';

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
                  ])
        ],
      ),
      body: productGrid(showFavorite: _showOnlyFav),
    );
  }
}
