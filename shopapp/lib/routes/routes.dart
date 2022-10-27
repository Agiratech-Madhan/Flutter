import 'package:flutter/material.dart';
import 'package:shopapp/screens/product_detail_screen.dart';
import 'package:shopapp/screens/cart_screen.dart';
import 'package:shopapp/screens/orderscreen.dart';
import 'package:shopapp/screens/products_overview_screens.dart';
import 'package:shopapp/screens/user_product_screen.dart';
import 'package:shopapp/screens/edit_product_screen.dart';

const r_productDetail = '/product-detail';
const r_Cart = '/cart';
const r_Orders = '/orders';
const r_UserProducts = '/user-products';
const r_EditProduct = '/edit-product';
const r_ProductOverview = '/product-overView';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case r_productDetail:
      return MaterialPageRoute(
        builder: (context) => ProductDetailScreen(),
      );
    case r_Cart:
      return MaterialPageRoute(
        builder: (context) => CartScreen(),
      );
    case r_Orders:
      return MaterialPageRoute(
        builder: (context) => OrderScreen(),
      );
    case r_UserProducts:
      return MaterialPageRoute(
        builder: (context) => UserProductsScreen(),
      );
    case r_EditProduct:
      return MaterialPageRoute(
        builder: (context) => EditProductScreen(),
      );
    case r_ProductOverview:
      return MaterialPageRoute(
        builder: (context) => ProductOverview(),
      );
    default:
      throw ('This is not a route name');
  }
}
