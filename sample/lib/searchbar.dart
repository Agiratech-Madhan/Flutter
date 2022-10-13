import 'package:flutter/material.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({super.key});

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  List<Chat> displayList = List.from(chatdata);
  void Searchfilter(String value) {
    setState(() {
      displayList = chatdata
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        title: Text('Hello Madhan'),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          TextField(
            onChanged: (value) => Searchfilter(value),
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'madhan',
                filled: true,
                fillColor: Colors.lightBlue.shade100,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: displayList.length,
                itemBuilder: ((context, i) => ListTile(
                      leading: const Icon(Icons.add),
                      title: Text(chatdata[i].name),
                    ))),
          )
        ],
      ),
    );
  }
}

class Chat {
  final String name;
  final String msg;
  final String time;
  final String pic;
  final String mentioned;
  final String reactions;
  Chat({
    required this.name,
    required this.msg,
    required this.time,
    required this.pic,
    required this.mentioned,
    required this.reactions,
  });
}

List<Chat> chatdata = [
  Chat(
      name: "Madhan",
      msg: 'hello madhan',
      time: '11m',
      pic: 'assets/images/person1.jpeg',
      mentioned: 'sample mentions',
      reactions: 'hello'),
  Chat(
      name: "Madhan",
      msg: 'Some changes are not ready to dev',
      time: '1hr',
      pic: 'assets/images/person1.jpeg',
      mentioned: 'sample mentions',
      reactions: 'hello'),
  Chat(
      name: "Madhan",
      msg: 'Some changes are not ready to dev',
      time: '1hr',
      pic: 'assets/images/person1.jpeg',
      mentioned: 'sample mentions',
      reactions: 'hello'),
  Chat(
      name: "Madhan",
      msg: 'Some changes are not ready to dev',
      time: '1hr',
      pic: 'assets/images/person1.jpeg',
      mentioned: 'sample mentions',
      reactions: 'hello'),
  Chat(
      name: "Madhan",
      msg: 'Some changes are not ready to dev',
      time: '1hr',
      pic: 'assets/images/person1.jpeg',
      mentioned: 'sample mentions',
      reactions: 'hello'),
  Chat(
      name: "Madhan",
      msg: 'Some changes are not ready to dev',
      time: '1hr',
      pic: 'assets/images/person1.jpeg',
      mentioned: 'sample mentions',
      reactions: 'hello'),
  Chat(
      name: "Madhan",
      msg: 'Some changes are not ready to dev',
      time: '1hr',
      pic: 'assets/images/person1.jpeg',
      mentioned: 'sample mentions',
      reactions: 'hello'),
  Chat(
      name: "Madhan",
      msg: 'Some changes are not ready to dev',
      time: '1hr',
      pic: 'assets/images/person1.jpeg',
      mentioned: 'sample mentions',
      reactions: 'hello'),
  Chat(
      name: "Madhan",
      msg: 'Some changes are not ready to dev',
      time: '1hr',
      pic: 'assets/images/person1.jpeg',
      mentioned: 'sample mentions',
      reactions: 'hello'),
  Chat(
      name: "Madhan",
      msg: 'Some changes are not ready to dev',
      time: '1hr',
      pic: 'assets/images/person1.jpeg',
      mentioned: 'sample mentions',
      reactions: 'hello'),
];
