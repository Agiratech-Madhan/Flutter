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

  void submitdata() {
    final t_text = titlecontroller.text;
    final amt_text = double.parse(amountcontroller.text);
    // print(t_text);
    // print(amt_text);
    if (t_text.isEmpty || amt_text <= 0) {
      return;
    }
    addTax(
      t_text,
      amt_text,
    );
  }

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
              onSubmitted: (_) => submitdata(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountcontroller,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitdata(),
              // onChanged: (value) => amtinput = value,
            ),
            TextButton(
              onPressed: submitdata,
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
