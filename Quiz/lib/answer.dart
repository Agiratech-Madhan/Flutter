import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;
  const Answer(this.selectHandler, this.answerText);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 250.0,

        // width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                // side: BorderSide(color: Colors.red)
              ))),
          // textStyle:MaterialSta
          // color:Colors.blue,
          onPressed: selectHandler,
          child: Text(answerText),

          // onPrimary: Colors.yellow,
        ),
      ),
    );
  }
}
