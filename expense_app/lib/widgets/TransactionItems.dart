import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TranasactionItems extends StatelessWidget {
  final Transaction transaction_;
  const TranasactionItems({
    Key? key,
    required this.transaction_,
    required this.d_trans,
  }) : super(key: key);

  final Function d_trans;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
          leading: CircleAvatar(
            radius: 20,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: FittedBox(
                child: Text('\$${transaction_.amount}'),
              ),
            ),
          ),
          title: Text(
            transaction_.Title,
            style: Theme.of(context).textTheme.headline6,
          ),
          subtitle: Text(
            DateFormat.yMMMd().format(transaction_.date),
          ),
          trailing: MediaQuery.of(context).size.width > 420
              ? TextButton.icon(
                  onPressed: () => d_trans(transaction_.id),
                  icon: const Icon(
                    Icons.delete,
                  ),
                  label: const Text("Delete"),
                  style: TextButton.styleFrom(
                      foregroundColor: Color.fromARGB(255, 255, 0, 0)),
                )
              : IconButton(
                  onPressed: () => d_trans(transaction_.id),
                  color: Color.fromARGB(255, 255, 0, 0),
                  icon: const Icon(
                    Icons.delete,
                  ),
                )),
    );
  }
}
