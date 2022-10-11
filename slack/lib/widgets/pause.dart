import 'package:flutter/material.dart';

class Pause extends StatefulWidget {
  const Pause({super.key});

  @override
  State<Pause> createState() => _PauseState();
}

class _PauseState extends State<Pause> {
  var _result;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(primarySwatch: null),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.cancel)),
                Flexible(
                    child: Text(
                  "Pause  Notifications",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )),
                TextButton(onPressed: null, child: Text("Save"))
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RadioListTile(
                    title: const Text('30  minutes'),
                    value: 1,
                    groupValue: _result,
                    onChanged: (value) {
                      setState(() {
                        _result = value;
                      });
                    }),
                RadioListTile(
                    title: const Text('1 hour'),
                    value: 2,
                    groupValue: _result,
                    onChanged: (value) {
                      setState(() {
                        _result = value;
                      });
                    }),
                RadioListTile(
                    title: const Text('2 hour'),
                    value: 3,
                    groupValue: _result,
                    onChanged: (value) {
                      setState(() {
                        _result = value;
                      });
                    }),
                RadioListTile(
                    title: const Text('Until tomorrow'),
                    value: 4,
                    groupValue: _result,
                    onChanged: (value) {
                      setState(() {
                        _result = value;
                      });
                    }),
                RadioListTile(
                    title: const Text('Custom'),
                    value: 5,
                    groupValue: _result,
                    onChanged: (value) {
                      setState(() {
                        _result = value;
                      });
                    }),

                // const SizedBox(height: 25),
                // Text(_result == 7 ? 'Correct!' : 'Please chose the right answer!')
              ],
            ),
            // Row(child)
          ],
        ),
      )),
    );
  }
}
