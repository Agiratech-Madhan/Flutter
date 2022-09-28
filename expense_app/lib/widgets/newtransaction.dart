// import 'dart:html';
import 'dart:io';
import '../widgets/adaptivebutton.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// import
class NewTransaction extends StatefulWidget {
  // const newTransaction({super.key});
  final Function addTax;
  NewTransaction(this.addTax);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titlecontroller = TextEditingController();

  final _amountcontroller = TextEditingController();
  // DateTime _selectedDate;
  dynamic _selectedDate;

  void _submitdata() {
    if (_amountcontroller.text.isEmpty) {
      return;
    }
    final t_text = _titlecontroller.text;
    final amt_text = double.parse(_amountcontroller.text);
    // print(t_text);
    // print(amt_text);
    if (t_text.isEmpty || amt_text <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTax(t_text, amt_text, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentdatepicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // DateTime _selectedDate;
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              left: 10,
              top: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'text'),
                // onChanged: (value) => titleInput = value
                controller: _titlecontroller,
                onSubmitted: (_) => _submitdata(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountcontroller,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitdata(),
                // onChanged: (value) => amtinput = value,
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Choosen Date!'
                            : 'Picked Date ${DateFormat.yMd().format(_selectedDate)}',
                      ),
                    ),
                    Adaptivebutton("Choose Date", _presentdatepicker),
                    // TextButton(
                    //   onPressed: null,
                    //   child: Text(
                    //     "Choose Date",
                    //   ),
                    //   style: TextButton.styleFrom(foregroundColor: Colors.purple),
                    // )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: _submitdata,
                child: Text(
                  "Add Transaction",
                  // style: TextStyle(color: Colors.purple),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
