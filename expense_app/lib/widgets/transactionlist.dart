import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import '../widgets/TransactionItems.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function d_trans;
  TransactionList(this.transaction, this.d_trans);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transaction.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints) {
              return Column(
                children: [
                  Text(
                    "No Transaction added yet",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            })
          : ListView.builder(
              itemBuilder: (contxt, index) {
                return TranasactionItems(
                    transaction_: transaction[index], d_trans: d_trans);
              },
              itemCount: transaction.length,
            ),
    );
  }
}

/** Card(
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2)),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          // e.amount.toString(),
                          '\$${transaction[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transaction[index].Title,
                            style: Theme.of(context).textTheme.headline6,

                            // TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            // e.date.toString(),
                            DateFormat.yMMMd().format(transaction[index].date),
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                );*/

                // ///ElevatedButton.icon(
                //               onPressed: () => d_trans(transaction[index].id),
                //               icon: Icon(
                //                 Icons.delete,
                //               ),
                //               style: ElevatedButton.styleFrom(
                //                   foregroundColor:
                //                       Color.fromARGB(255, 255, 0, 0)
                //                   // Theme.of(context).primaryColor
                //                   ,
                //                   backgroundColor: Colors.white),
                //               label: Text("Delete")),