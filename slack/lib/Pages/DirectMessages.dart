import 'package:flutter/material.dart';
import '../models/Chatmodel.dart';
// import '../models/Chatmodel.dart';

class DirectMessages extends StatefulWidget {
  const DirectMessages({super.key});

  @override
  State<DirectMessages> createState() => _DirectMessagesState();
}

class _DirectMessagesState extends State<DirectMessages> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Direct messages'),
          // backgroundColor: Colors.pink,
          backgroundColor: const Color(0xff002A36),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              height: 40,
              child: TextField(
                onTap: null,
                decoration: InputDecoration(
                  hintText: 'Jump to...',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 1, color: Color.fromARGB(255, 204, 200, 200)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                //  item
                shrinkWrap: true,
                itemCount: chatdata.length,
                // physics: BouncingScrollPhysics(),
                itemBuilder: (context, i) => Column(
                  children: [
                    ListTile(
                      leading: SizedBox(
                        width: 50,
                        height: 50,
                        child:
                            Stack(alignment: Alignment.bottomRight, children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(chatdata[i].pic),
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
                      title: Text(chatdata[i].name),
                      subtitle: Text(chatdata[i].msg),
                      trailing: Text(chatdata[i].time),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
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
