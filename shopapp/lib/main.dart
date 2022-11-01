import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopapp/providers/auth.dart';
import 'package:shopapp/providers/orders.dart';
import 'package:shopapp/screens/authscreen.dart';
import 'package:shopapp/screens/cart_screen.dart';
import 'package:shopapp/screens/edit_product_screen.dart';
import 'package:shopapp/screens/orderscreen.dart';
import 'package:shopapp/screens/product_detail_screen.dart';
import 'package:shopapp/screens/products_overview_screens.dart';
import 'package:shopapp/screens/user_product_screen.dart';
// import 'package:shopapp/widgets/user_product_item.dart';
import './providers/product_provider.dart';
import 'package:provider/provider.dart';
import 'providers/cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color primaryAccentColor = const Color(0xff002A36);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
        ChangeNotifierProxyProvider<Auth, Products>(
          // update: 'update',
          create: (_) => Products(items_: [], authtoken: '', userId: ''),
          update: (context, auth, previousProducts) => Products(
              authtoken: auth.token,
              items_: previousProducts == null ? [] : previousProducts.items,
              userId: auth.userId),
        ),
        ChangeNotifierProvider(create: (ctx) => Cart()),
        ChangeNotifierProxyProvider<Auth, Orders>(
            update: (context, auth, previousOrders) => Orders(
                authToken: auth.token,
                orders_: previousOrders == null ? [] : previousOrders.orders),
            create: (ctx) => Orders(authToken: '', orders_: [])),
      ],
      child: Consumer<Auth>(
          builder: (context, auth, _) => MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                  // splashColor: Colors.pink,
                  // shadowColor: Colors.pink,
                  // primarySwatch: Colors.purple,
                  primaryColor: Colors.orange,
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: primaryAccentColor),
                  textTheme: GoogleFonts.notoSansTextTheme(
                      Theme.of(context).textTheme),
                ),
                home: auth.isAuth ? ProductOverview() : AuthScreen(),
                routes: {
                  ProductDetailScreen.routeName: (context) =>
                      ProductDetailScreen(),
                  CartScreen.routeName: (context) => CartScreen(),
                  OrderScreen.routeName: (context) => OrderScreen(),
                  UserProductsScreen.routeName: (context) =>
                      UserProductsScreen(),
                  EditProductScreen.routeName: (context) => EditProductScreen(),
                },
              )),
    );
  }
}
