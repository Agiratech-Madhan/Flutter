import 'package:flutter/material.dart';
import 'package:slack/models/mentionsmodel.dart';
import '/models/Chatmodel.dart';

// class Jumpto extends StatefulWidget {
//   const Jumpto({super.key});

//   @override
//   State<Jumpto> createState() => _JumptoState();
// }

// class _JumptoState extends State<Jumpto> {
// List<Chat> displayList = List.from(chatdata);
// void Searchfilter(String value) {
//   setState(() {
//     displayList = chatdata
//         .where((element) =>
//             element.name.toLowerCase().contains(value.toLowerCase()))
//         .toList();
//   });
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white10,
//         title: Text('Hello Madhan'),
//       ),
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           TextField(
//             onChanged: (value) => Searchfilter(value),
//             decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.search),
//                 hintText: 'madhan',
//                 filled: true,
//                 fillColor: Colors.lightBlue.shade100,
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide.none,
//                     borderRadius: BorderRadius.circular(10))),
//           ),
//           Expanded(
//             child: ListView.builder(
//                 itemCount: displayList.length,
//                 itemBuilder: ((context, i) => ListTile(
//                       leading: const Icon(Icons.add),
//                       title: Text(chatdata[i].name),
//                     ))),
//           )
//         ],
//       ),
//     );
//   }
// }

class Jumpto extends StatefulWidget {
  const Jumpto({super.key});

  @override
  State<Jumpto> createState() => _JumptoState();
}

class _JumptoState extends State<Jumpto> {
  bool changed = true;
  List<MentionsModel> displayList = List.from(Mentions_list);
  void searchfilter(String value) {
    setState(() {
      // changed = value;
      // print(changed);
      displayList = Mentions_list.where((element) =>
          element.m_group.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    print("changed$changed");
    var groups = Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 17.0),
          child: Text("Recent"),
        ));
    return Scaffold(
      // appBar: AppBar(
      //   leading: Icon(Icons.arrow_back),
      //   title: TextField(
      //     decoration: InputDecoration(
      //       labelText: 'Jump to...',
      //       enabledBorder: OutlineInputBorder(
      //         borderSide: const BorderSide(
      //             width: 1, color: Color.fromARGB(255, 204, 200, 200)),
      //         borderRadius: BorderRadius.circular(5),
      //       ),
      //     ),
      //   ),
      // ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
            height: 40,
            child: TextField(
              onChanged: (value) {
                // setState(() {
                // changed = value ;
                changed = false;
                // print(changed);
                // print('value$value');
                return searchfilter(value);
              },
              decoration: InputDecoration(
                border: InputBorder.none,

                contentPadding: EdgeInsets.only(top: 5),
                prefixIcon: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back_ios)),

                prefixIconColor: Colors.grey,
                filled: true,
                suffixIcon: Icon(Icons.mic),
                hintText: 'Jump to...',
                // fillColor: Color.fromARGB(255, 204, 200, 200),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 1, color: Color.fromARGB(255, 204, 200, 200)),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),

          changed
              ? accountlist(context)
              : displayList.isNotEmpty
                  ? accountlist(context)
                  : Container(),
          changed ? groups : Container(),
          // changed
          //     ? Container()
          //     : displayList.isEmpty
          //         ? accountlist(context)
          //         : Container(),
          changed
              ? Expanded(
                  child: ListView.builder(
                      // scrollDirection: Axis.horizontal,
                      itemCount: Mentions_list.length,
                      itemBuilder: ((context, i) => Row(children: [
                            const Padding(
                                padding: EdgeInsets.all(10),
                                child: Icon(Icons.lock)),
                            Text(Mentions_list[i].m_group),
                          ]))),
                )
              : Expanded(
                  child: ListView.builder(
                      // scrollDirection: Axis.horizontal,
                      itemCount: displayList.length,
                      itemBuilder: ((context, i) => Row(children: [
                            const Padding(
                                padding: EdgeInsets.all(10),
                                child: Icon(Icons.lock)),
                            Text(displayList[i].m_group),
                          ]))),
                ),

          // ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: 6,
          //     itemBuilder: ((context, i) => ListTile(
          //           leading: const Icon(Icons.add),
          //           title: Text(chatdata[i].name),
          //         ))),
          // ListView.builder(itemBuilder: (itemBuilder))
        ],
      ),
    );
  }

  Padding accountlist(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.18,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: chatdata.length,
            itemBuilder: (context, i) {
              return Container(
                padding: EdgeInsets.all(8),
                child: InkWell(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Image.asset(chatdata[i].pic))),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(chatdata[i].name),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
