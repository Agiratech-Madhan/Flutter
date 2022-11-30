import 'package:flutter/material.dart';
import '../routes/routes.dart' as route;

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
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
      body: CustomScrollView(
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
            shape: RoundedRectangleBorder(),
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
              delegate: SliverChildListDelegate([
            Text('data'),
          ])),
          // SliverLayoutBuilder(
          //     builder: ((p0, p1) => SliverToBoxAdapter(
          //           child: Text('data'),
          //         )))
          SliverFillRemaining(
            child: Text('data'),
          ),
        ],
      ),
    );
  }
}
