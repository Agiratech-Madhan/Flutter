import 'package:flutter/material.dart';
import 'package:shopapp/providers/cart.dart';
import 'package:shopapp/providers/orders.dart' as ord;
import 'package:intl/intl.dart';
import 'dart:math';

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;

  const OrderItem({super.key, required this.order});

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${widget.order.amount}'),
            subtitle:
                Text(DateFormat('dd MM yyyy').format(widget.order.dateTime)),
            trailing: IconButton(
                onPressed: (() {
                  setState(() {
                    _expanded = !_expanded;
                  });
                }),
                icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more)),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
              height: min(widget.order.products.length * 20.0 + 10, 100),
              child: ListView(
                children: widget.order.products
                    .map(
                      (e) => orderdescription(e),
                    )
                    .toList(),
              ),
            )
        ],
      ),
    );
  }

  Row orderdescription(CartItem e) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(e.title), Text('${e.quantity}x \$${e.price}')],
    );
  }
}
