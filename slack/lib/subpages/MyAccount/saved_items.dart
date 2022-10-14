import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SavedItems extends StatefulWidget {
  const SavedItems({super.key});

  @override
  State<SavedItems> createState() => _SavedItemsState();
}

class _SavedItemsState extends State<SavedItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
            icon: Icon(Icons.cancel_outlined),
            onPressed: () => Navigator.pop(context)),
        title: Text('Saved Items'),
      ),
      body: Container(
        // width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.bookmark_border_rounded,
              color: Colors.grey,
              size: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                'No saved Items',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 10,
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1),
              child: Text(
                'Add messaeges and files to easily come back to them later',
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
