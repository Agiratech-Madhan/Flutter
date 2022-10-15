import 'package:flutter/material.dart';

import 'package:slack/models/mentionsmodel.dart';
// import 'package:slack/models/Chatmodel.dart';

// import './models/mentionsmodel.dart';
// import '.../pages/';
// import '....../models/Chatmodel.dart';

class Threads extends StatefulWidget {
  const Threads({super.key});

  @override
  State<Threads> createState() => _ThreadsState();
}

class _ThreadsState extends State<Threads> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shape: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios)),
        title: Text('Threads'),
      ),
      body: Column(
        children: [
          Container(
            height: 40,
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * 1,
            color: Colors.grey.withOpacity(0.5),
            child: Text(
              ' No new replies',
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ),
          Expanded(
            child: ListView.builder(
              //  item
              shrinkWrap: true,
              itemCount: Mentions_list.length,
              // physics: BouncingScrollPhysics(),
              itemBuilder: (context, i) => Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Mentions_list[i].m_group,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text(
                              Mentions_list[i].m_name,
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(',${Mentions_list[3].m_name}',
                                style: TextStyle(color: Colors.grey))
                          ],
                        )
                      ],
                    ),
                  ),
                  ListTile(
                    leading: SizedBox(
                      width: 50,
                      height: 50,
                      child: Stack(alignment: Alignment.bottomRight, children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(Mentions_list[i].m_image),
                        ),
                        if (true)
                          Positioned(
                            bottom: -2,
                            right: -2,
                            child: Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(25),
                                border:
                                    Border.all(width: 3, color: Colors.white),
                              ),
                            ),
                          )
                      ]),
                    ),
                    title: Row(
                      children: [
                        Text(
                          Mentions_list[i].m_name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          // "{Mentions_list[i].m_time}",
                          // Mentions_list[i].m_time,
                          ' Oct 15 3:17 PM',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        )
                      ],
                    ),
                    subtitle: Text(
                      Mentions_list[i].m_message,
                      style: const TextStyle(fontSize: 15),
                    ),
                    // trailing: Text(Mentions_list[i].m),
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
                                  Text(Mentions_list[i].m_reactions),
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
                  !(i == Mentions_list.length - 1)
                      ? Divider(
                          color: Colors.grey,
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
