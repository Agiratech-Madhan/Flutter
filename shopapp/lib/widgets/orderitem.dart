import 'package:flutter/material.dart';
import 'package:shopapp/providers/orders.dart' as ord;
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
  final ord.OrderItem order;

  const OrderItem({super.key, required this.order});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${order.amount}'),
            subtitle: Text(DateFormat('dd MM yyyy').format(order.dateTime)),
            trailing:
                IconButton(onPressed: null, icon: Icon(Icons.expand_more)),
          )
        ],
      ),
    );
  }
}
