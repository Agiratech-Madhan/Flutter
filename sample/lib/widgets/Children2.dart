// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Children extends StatefulWidget {
  // final sam1;
  // Children(this.sam1);
  @override
  State<Children> createState() => _ChildrenState();
}

class _ChildrenState extends State<Children> {
  final sam = Container(width: 300, height: 300, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: sam,
            ),
            ClipOval(
              child: sam,
            ),
            ClipPath(
              clipper: Triangleclipper(),
              child: sam,
            )
          ],
        ),
      ],
    );
  }
}

class Triangleclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
    // throw UnimplementedError();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
