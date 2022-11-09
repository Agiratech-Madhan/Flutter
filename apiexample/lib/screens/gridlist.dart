// import 'package:apiexample/providers/providerexample.dart';
// import 'package:flutter/material.dart';
// import 'package:apiexample/models/student.dart';
// import 'package:provider/provider.dart';

// class GridListItems extends StatefulWidget {
//   @override
//   State<GridListItems> createState() => _GridListItemsState();
// }

// class _GridListItemsState extends State<GridListItems> {
//   @override
//   Widget build(BuildContext context) {
//     final itemProvider = Provider.of<ProviderExample>(context);
//     return GridView.builder(
//         padding: const EdgeInsets.all(10),
//         itemCount: itemProvider.sitem.length,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             childAspectRatio: 3 / 2,
//             crossAxisSpacing: 10,
//             mainAxisSpacing: 10),
//         itemBuilder: (context, index) => Card(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10)),
//               child: GestureDetector(
//                   onTap: () {},
//                   child: Center(
//                       child: Text(
//                     '${itemProvider.sitem[index].name}',
//                     style: TextStyle(color: Colors.black),
//                   ))),
//             ));
//   }
// }
