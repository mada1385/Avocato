import 'package:flutter/material.dart';

class Goldcircleavatar extends StatelessWidget {
  final double size;
  // final Image userimage ;

  const Goldcircleavatar({
    @required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: CircleAvatar(
          backgroundImage: AssetImage("asset/man.jpg"),
          backgroundColor: Colors.transparent,
          radius: size,
        ),
        width: size,
        height: size,
        padding: const EdgeInsets.all(2.0), // border width
        decoration: new BoxDecoration(
          color: const Color(0xffDDB74B), // border color
          shape: BoxShape.circle,
        ));
  }
}
