import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchList extends StatefulWidget {
  const SearchList({super.key});

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
          child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          // margin: EdgeInsets.only(left: 15, right: 15),
          child: ListView.builder(
              itemCount: 50,
              itemBuilder: ((context, index) => Container(
                    // height: 68,
                    // color: Colors.red,
                    child: Container(
                        // height: 60,
                        margin: EdgeInsets.only(left: 12, right: 12),
                        // padding: EdgeInsets.all(3),
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(10),
                        // color: Colors.pink,
                        // ),
                        padding: EdgeInsets.all(2),
                        child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                shadowColor: Colors.transparent,
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.white),
                            onPressed: () {},
                            icon: Icon(Icons.lock),
                            label: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    // top: 7,
                                    // bottom: 7,
                                    left: MediaQuery.of(context).size.width *
                                        0.10,
                                  ),
                                  child: Text(
                                    'label',
                                    style: const TextStyle(fontSize: 19),
                                  ),
                                ),
                              ],
                            ))
                        // ListTile(
                        //   onTap: () {},
                        //   leading: Icon(Icons.lock),
                        //   title: Text('Ak Vignesh'),
                        // ),
                        ),
                  ))),
        ),
      )),
    );
  }
}
