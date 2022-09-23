// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

// import
class NewTransaction extends StatelessWidget {
  // const newTransaction({super.key});
  final Function addTax;
  NewTransaction(this.addTax);
  final titlecontroller = TextEditingController();
  final amountcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'text'),
              // onChanged: (value) => titleInput = value
              controller: titlecontroller,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountcontroller,
              // onChanged: (value) => amtinput = value,
            ),
            TextButton(
              onPressed: () {
                addTax(
                  titlecontroller.text,
                  double.parse(amountcontroller.text),
                );

                // print(titleInput);
                // print(amtinput);
              },
              child: Text(
                "Add Transaction",
                style: TextStyle(color: Colors.purple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
