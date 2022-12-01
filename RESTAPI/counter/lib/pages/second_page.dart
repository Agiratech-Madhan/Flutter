import 'package:flutter/material.dart';
import '../routes/routes.dart' as route;

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<String> items = ['1', '2', '3', '4', '5'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           Navigator.of(context).pushNamed(route.thirdPage);
      //         },
      //         icon: Icon(Icons.arrow_forward))
      //   ],
      //   title: Text('SecondPage'),
      // ),
      body:
          //     ListView.custom(

          //         // itemExtent: 50,
          //         childrenDelegate: SliverChildBuilderDelegate(((context, index) {
          //   // print(index);
          //   childCount:
          //   items.length;
          //   return Card(
          //     color: Colors.pink,
          //     child: Text('items[$index].toString()'),
          //   );
          // })))

          CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Siver Page'),
            automaticallyImplyLeading: true,
            scrolledUnderElevation: 10,
            surfaceTintColor: Colors.orange, //
            foregroundColor: Colors.red,
            backgroundColor: Colors.green,
            forceElevated: true,
            // elevation: 20,
            centerTitle: true,
            shadowColor: Colors.blue,
            primary: true,
            excludeHeaderSemantics: true, //
            titleSpacing: 90,
            // collapsedHeight: 70,
            floating: false,
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Text('data'),
            ),
            // snap: true,//
            stretchTriggerOffset: 40.0, //
            shape: const RoundedRectangleBorder(),
            stretch: true,
            // leadingWidth: 300, //
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(route.thirdPage);
                  },
                  icon: const Icon(Icons.arrow_forward))
            ],
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
            pinned: true,
            // toolbarHeight: 200, //
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('SecondPage'),
              centerTitle: true,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return ListTile(
                  leading: const SizedBox(width: 100, child: CircleAvatar()),
                  title: Text('Place ${index + 1}', textScaleFactor: 1),
                );
              },
              childCount: 20,
            ),
          ),
          // SliverLayoutBuilder(
          //     builder: ((p0, p1) => SliverToBoxAdapter(
          //           child: Text('data'),
          //         )))
          /*  SliverFillRemaining(
                  // child: Text('data'),
                  child: ListBody(
                children: const [
                  Text('Object'),
                  Text('Object'),
                  Text('Object'),
                  Text('Object'),
                  Text('Object'),
                ],
              )
                  /* ListWheelScrollView(
                itemExtent: 50,
                squeeze: 1.0,
                onSelectedItemChanged: (value) {
                  print('object');
                },
                diameterRatio: 1.5,
                offAxisFraction: -1.0,
                useMagnifier: true,
                children: const [
                  Text('data'),
                  Text('data'),
                  Text('data'),
                  Text('data'),
                  Text('data'),
                  Text('data'),
                  Text('data'),
                  Text('data'),
                  Text('data'),
                ],
              )*/*/
        ],
      ),
    );
  }
}
