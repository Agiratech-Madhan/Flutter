// import 'dart:html';

import 'package:flutter/material.dart';
import '../models/Searchmodel.dart';
import '../models/mentionsmodel.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool onfocus = false;
  TextEditingController textFieldController = TextEditingController();
  void _getvalue(String value, int index) {
    index == 0
        ? textFieldController.text = '$value#'
        : textFieldController.text = '$value';
    // textFieldController
    textFieldController.selection = TextSelection.fromPosition(
        TextPosition(offset: textFieldController.text.length));
  }

  List<MentionsModel> displayList = List.from(Mentions_list);
  void searchfilter(String value) {
    setState(() {
      // if (textFieldController.text.startsWith('in:'))
      displayList = Mentions_list.where((element) {
        // (element.m_group).toLowerCase().contains(value.toLowerCase()) ||
        //     (element.m_message).toLowerCase().contains(value.toLowerCase()) ||
        return ((element.m_name).toLowerCase().contains(value.toLowerCase()));
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color(0xff002A36).withOpacity(0.6),
        backgroundColor: Color(0xff002A36),
        title: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            width: double.infinity,
            height: 40,
            // color: Color(white).withOpacity(0.5),
            color: Colors.white,
            child: Center(
              child: TextField(
                controller: textFieldController,
                onTap: () => {},
                onChanged: (value) {
                  // setState(() {
                  // changed = value ;
                  // changed = false;
                  // print(changed);
                  // print('value$value');
                  return searchfilter(value);
                },
                decoration: InputDecoration(
                    hintText: 'Search for something',
                    prefixIcon: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(textFieldController.text.isEmpty
                            ? Icons.search
                            : Icons.arrow_back_ios)),
                    suffixIcon: Icon(
                      Icons.mic,
                      color: Colors.black,
                    )),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            textFieldController.text.isEmpty
                ? Container(
                    margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: ElevatedButton.icon(
                        label: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              style: GoogleFonts.notoSans(color: Colors.black),
                              'Browse People',
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        icon: Icon(
                          Icons.perm_contact_calendar_rounded,
                          color: Colors.black,
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.grey,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                        onPressed: () {}),
                  )
                : Container(),
            textFieldController.text.isEmpty
                ? SizedBox(
                    // margin: EdgeInsets.all(12),
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: ElevatedButton.icon(
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Browse Channels',
                            style: GoogleFonts.notoSans(color: Colors.black),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      icon:
                          Icon(Icons.transgender_outlined, color: Colors.black),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.grey,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                      onPressed: () {}
                      // () => Navigator.push(
                      //       context,
                      //       MaterialPageRoute(builder: (context) => Jumpto()),
                      //     )
                      ,
                      // icon: const Icon(Icons.sentiment_satisfied_alt_outlined),
                      // child: const Padding(
                      //   padding: EdgeInsets.only(right: 220, top: 12, bottom: 12),
                      //   child: Text(
                      //     "Jump to....",
                      //     textAlign: TextAlign.start,
                      //     style: GoogleFonts.notoSans(fontSize: 15),
                      //   ),
                      // )
                    ),
                  )
                : Container(),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25, top: 10),
                      child: Text(
                        'Narrow your search',
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                    // physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: Searchlist.length,
                    itemBuilder: ((context, i) => Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: ElevatedButton.icon(
                              label: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    style: GoogleFonts.notoSans(
                                        color: Colors.black, fontSize: 15),
                                    Searchlist[i].value,
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(Searchlist[i].example)
                                ],
                              ),
                              icon: Searchlist[i].icon,
                              // color: Colors.black,

                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.grey,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  )),
                              onPressed: () {
                                _getvalue(Searchlist[i].value, i);
                              }),
                        )))
              ],
            ),
            // ListView.builder(
            //     // scrollDirection: Axis.horizontal,
            //     itemCount: displayList.length,
            //     itemBuilder: ((context, i) => Row(children: [
            //           const Padding(
            //               padding: EdgeInsets.all(10), child: Icon(Icons.lock)),
            //           Text(displayList[i].m_group),
            //         ]))),
          ],
        ),
      ),
    );
  }
}
