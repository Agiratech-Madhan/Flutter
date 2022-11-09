import 'package:apiexample/providers/providerexample.dart';
import 'package:flutter/material.dart';
import 'package:apiexample/models/student.dart';
import 'package:provider/provider.dart';

class GridListItems extends StatefulWidget {
  @override
  State<GridListItems> createState() => _GridListItemsState();
}

class _GridListItemsState extends State<GridListItems> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProviderExample>(context, listen: false).getvalues();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderExample>(
      builder: (context, itemProvider, child) => (itemProvider.sitem.isEmpty)
          ? CircularProgressIndicator()
          : GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: itemProvider.sitem.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (context, index) => Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: GestureDetector(
                      onTap: () {},
                      child: Stack(
                        children: [
                          Container(
                              child: Center(
                            child: Image.network(
                              itemProvider.sitem[index].imageURL.toString(),
                              fit: BoxFit.fill,
                            ),
                          )),
                          Positioned(
                              top: 10,
                              left: 20,
                              child: Text('${itemProvider.sitem[index].name}'))
                        ],
                      ),
                    ),
                  )),
    );
  }
}
