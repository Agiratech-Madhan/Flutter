import 'package:flutter/material.dart';

class AnimationExample extends StatefulWidget {
  const AnimationExample({super.key});

  @override
  State<AnimationExample> createState() => _AnimationExampleState();
}

class _AnimationExampleState extends State<AnimationExample> {
  late bool selected;
  @override
  void initState() {
    // TODO: implement initState
    selected = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: Center(
          child: AnimatedContainer(
              child: FlutterLogo(size: 76),
              width: selected ? 200.0 : 100.0,
              height: selected ? 100.0 : 200.0,
              color: selected ? Colors.blueGrey : Colors.white,
              alignment:
                  selected ? Alignment.center : AlignmentDirectional.topCenter,
              duration: Duration(seconds: 2),
              curve: Curves.fastOutSlowIn),
          // AnimatedContainer
        ), // Center
      ),
    ); // GestureDetector
  }
}
// Animatedcrossfade(
//   firstchild:Image.asset('name'),
//   secondchild:Image.asset('name'),
//   crossFadeState:true?crossFadeState.showFirst: crossFadeState.showSecond,
//   duration:Duraion(seconds:2)
// )
