import 'package:flutter/material.dart';
import './Cards.dart';
import './dropdown.dart';
import './Searchlist.dart';

class PageViewController extends StatefulWidget {
  const PageViewController({super.key});

  @override
  State<PageViewController> createState() => _PageViewControllerState();
}

class _PageViewControllerState extends State<PageViewController> {
  int pagechanged = 0;
  @override
  PageController controller_ = PageController(initialPage: 1);
  Widget build(BuildContext context) {
    return PageView(
      controller: controller_,
      onPageChanged: (index) {
        setState(() {
          pagechanged = index;
        });
        print(pagechanged);
      },
      children: [
        Cards(), Drop(), SearchList()

        // Container(
        //   color: Colors.red,
        // )
      ],
    );
  }
}
// Cards(), Drop(), SearchList()