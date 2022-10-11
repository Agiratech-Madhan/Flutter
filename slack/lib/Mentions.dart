import 'package:flutter/material.dart';
import './Chatmodel.dart';

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
          backgroundColor: Colors.pink,
          title: Text(
            "Mentions & reactions",
            style: TextStyle(fontSize: 24),
          ),
        ),
        body: Container(
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(chatdata[i].pic),
                    ),
                  ),
                  title: Text(chatdata[i].name),
                  subtitle: Text(chatdata[i].msg),
                  trailing: Text(chatdata[i].time),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
