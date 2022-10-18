import 'package:flutter/material.dart';
import 'package:slack/models/mentionsmodel.dart';
import '/models/Chatmodel.dart';
import 'package:google_fonts/google_fonts.dart';

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
      displayList = Mentions_list.where((element) =>
          element.m_group.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }

  TextEditingController Text_controller = TextEditingController();
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
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
            height: 40,
            child: TextField(
              controller: Text_controller,
              onChanged: (value) {
                changed = false;

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
              : (displayList.isNotEmpty || Text_controller.text.isEmpty)
                  ? accountlist(context)
                  : Container(),
          changed ? groups : Container(),
          changed ? defaultlist() : filterlist(displayList: displayList),
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

class filterlist extends StatelessWidget {
  const filterlist({
    Key? key,
    required this.displayList,
  }) : super(key: key);

  final List<MentionsModel> displayList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          // scrollDirection: Axis.horizontal,
          itemCount: displayList.length,
          itemBuilder: ((context, i) => Row(children: [
                const Padding(
                    padding: EdgeInsets.all(10), child: Icon(Icons.lock)),
                Text(displayList[i].m_group),
              ]))),
    );
  }
}

class defaultlist extends StatelessWidget {
  const defaultlist({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          // scrollDirection: Axis.horizontal,
          itemCount: Mentions_list.length,
          itemBuilder: ((context, i) => Row(children: [
                const Padding(
                    padding: EdgeInsets.all(10), child: Icon(Icons.lock)),
                Text(Mentions_list[i].m_group),
              ]))),
    );
  }
}
