import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TranasactionItems extends StatefulWidget {
  final Transaction transaction_;
  const TranasactionItems({
    Key? key,
    required this.transaction_,
    required this.d_trans,
  }) : super(key: key);

  final Function d_trans;

  @override
  State<TranasactionItems> createState() => _TranasactionItemsState();
}

class _TranasactionItemsState extends State<TranasactionItems> {
  Color? bgColor;
  @override
  void initState() {
    const availablecolor = [
      Colors.blue,
      Colors.yellow,
      Colors.pink,
      Colors.orange
    ];
    bgColor = availablecolor[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
          leading: CircleAvatar(
            backgroundColor: bgColor,
            radius: 20,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: FittedBox(
                child: Text('\$${widget.transaction_.amount}'),
              ),
            ),
          ),
          title: Text(
            widget.transaction_.Title,
            style: Theme.of(context).textTheme.headline6,
          ),
          subtitle: Text(
            DateFormat.yMMMd().format(widget.transaction_.date),
          ),
          trailing: MediaQuery.of(context).size.width > 420
              ? TextButton.icon(
                  onPressed: () => widget.d_trans(widget.transaction_.id),
                  icon: const Icon(
                    Icons.delete,
                  ),
                  label: const Text("Delete"),
                  style: TextButton.styleFrom(
                      foregroundColor: Color.fromARGB(255, 255, 0, 0)),
                )
              : IconButton(
                  onPressed: () => widget.d_trans(widget.transaction_.id),
                  color: Color.fromARGB(255, 255, 0, 0),
                  icon: const Icon(
                    Icons.delete,
                  ),
                )),
    );
  }
}
