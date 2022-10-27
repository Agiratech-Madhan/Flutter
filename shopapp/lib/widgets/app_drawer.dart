import 'package:flutter/material.dart';
import 'package:shopapp/screens/user_product_screen.dart';
import '../screens/orderscreen.dart';
import '../routes/routes.dart' as route;

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Hello Mad_han'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(route.r_ProductOverview);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(route.r_Orders);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage your Product'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(route.r_UserProducts);
            },
          )
        ],
      ),
    );
  }
}
