// import 'package:flutter/material.dart';

// void main() {
//   runApp(Radiosam());
// }

// class Radiosam extends StatelessWidget {
//   // const Radiosam({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       // Hide the debug banner
//       debugShowCheckedModeBanner: false,
//       title: 'Kindacode.com',
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   // The group value
//   var _result;
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           'Kindacode.com',
//         ),
//       ),
//       body: Padding(
//           padding: const EdgeInsets.all(25),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text('1 + 2 + 4 = ?'),

//               RadioListTile(
//                   title: const Text('7'),
//                   value: 1,
//                   groupValue: _result,
//                   onChanged: (value) {
//                     setState(() {
//                       _result = value;
//                     });
//                   }),
//               RadioListTile(
//                   title: const Text('5.4'),
//                   value: 2,
//                   groupValue: _result,
//                   onChanged: (value) {
//                     setState(() {
//                       _result = value;
//                     });
//                   }),
//               const SizedBox(height: 25),
//               Column(
//                 children: [
//                   TextField(
//                     decoration: InputDecoration(),
//                   )
//                 ],
//               )
//               // Text(_result == 7 ? 'Correct!' : 'Please chose the right answer!')
//             ],
//           )),
//     );
//   }
// }

import 'package:flutter/material.dart';

class Radiosam extends StatefulWidget {
  @override
  _RadiosamState createState() => _RadiosamState();
}

class _RadiosamState extends State<Radiosam> {
  Color? _bgColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: _bgColor,
      child: Column(
        children: [
          Text(
            "\nSet background color\n",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          RadioListTile<Color>(
            title: const Text('Green'),
            value: Colors.lightGreen,
            groupValue: _bgColor,
            onChanged: (Color? value) {
              setState(() {
                _bgColor = value;
              });
            },
          ),
          RadioListTile<Color>(
            title: const Text('Yellow'),
            value: Colors.yellowAccent,
            groupValue: _bgColor,
            onChanged: (Color? value) {
              setState(() {
                _bgColor = value;
              });
            },
          ),
          RadioListTile<Color>(
            title: const Text('Blue'),
            value: Colors.lightBlueAccent,
            groupValue: _bgColor,
            onChanged: (Color? value) {
              setState(() {
                _bgColor = value;
              });
            },
          ),
          RadioListTile<Color>(
            title: const Text('Cyan'),
            value: Colors.cyanAccent,
            groupValue: _bgColor,
            onChanged: (Color? value) {
              setState(() {
                _bgColor = value;
              });
            },
          ),
          RadioListTile<Color>(
            title: const Text('White'),
            value: Colors.white,
            groupValue: _bgColor,
            onChanged: (Color? value) {
              setState(() {
                _bgColor = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
