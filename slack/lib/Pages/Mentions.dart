import 'package:flutter/material.dart';
import '../models/Chatmodel.dart';
import '../models/mentionsmodel.dart';

class Mentions extends StatefulWidget {
  const Mentions({super.key});

  @override
  State<Mentions> createState() => _MentionsState();
}

class _MentionsState extends State<Mentions> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff002A36),

          // backgroundColor: Colors.pink,
          title: Text(
            "Mentions & reactions",
            style: TextStyle(fontSize: 24),
          ),
        ),
        body: ListView.builder(
          itemCount: Mentions_list.length,
          itemBuilder: ((context, index) => Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 15,
                        left: MediaQuery.of(context).size.width * 0.22,
                        right: MediaQuery.of(context).size.width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Mentions_list[index].m_Header,
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                Mentions_list[index].m_group,
                              )
                            ],
                          ),
                        ),
                        Text(
                          '1hr',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.asset(Mentions_list[index].m_image)),
                    ),
                    title: Text(
                      Mentions_list[index].m_name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      Mentions_list[index].m_message,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                      maxLines: 4,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.227,
                        top: 10,
                        right: MediaQuery.of(context).size.width * 0.10),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 50,
                                height: 30,
                                // color: Colors.lightBlue[100],
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.5, color: Colors.blue),
                                  color: Colors.lightBlue[100],
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(15),
                                      right: Radius.circular(15)),
                                ),
                                // decoration: BoxDecoration(
                                //     border:
                                //         Border.all(width: 1, color: Colors.blue)),
                              ),
                            ),
                            Positioned.fill(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(Mentions_list[index].m_reactions),
                                  Text('1')
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(15),
                                  right: Radius.circular(15)),
                              child: Container(
                                width: 40,
                                height: 30,
                                color: Colors.grey[200],
                                // decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                            Builder(builder: (context) {
                              return Positioned.fill(
                                child: FittedBox(
                                  child: IconButton(
                                      iconSize: 30.0,
                                      onPressed: () {},
                                      icon:
                                          Icon(Icons.emoji_emotions_outlined)),
                                ),
                              );
                            })
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                ],
              )),
        ),
        // body: Container(
        //   child: ListView.builder(
        //     //  item
        //     shrinkWrap: true,
        //     itemCount: chatdata.length,
        //     // physics: BouncingScrollPhysics(),
        //     itemBuilder: (context, i) => Column(
        //       children: [
        //         ListTile(
        //           leading: SizedBox(
        //             width: 50,
        //             height: 50,
        //             child: ClipRRect(
        //               borderRadius: BorderRadius.circular(5),
        //               child: Image.asset(chatdata[i].pic),
        //             ),
        //           ),
        //           title: Column(
        //             children: [
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   Text(chatdata[i].mentioned),
        //                   Text(chatdata[i].time)
        //                 ],
        //               ),
        //               Text(chatdata[i].name),
        //               Text(chatdata[i].msg),
        //               Text(chatdata[i].reactions)
        //             ],
        //           ),
        //           // title: Text(chatdata[i].name),
        //           // subtitle: Text(chatdata[i].msg),

        //           // trailing: Text(chatdata[i].time),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          elevation: 10,
          child: Icon(Icons.edit),
          backgroundColor: Color(0xff002A36),
        ),
      ),
    );
  }
}
