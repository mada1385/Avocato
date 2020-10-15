import 'package:flutter/material.dart';
import 'package:mydream/components/readmore.dart';
import 'package:mydream/constants/colours.dart';

class Commentfield extends StatelessWidget {
  final String text;
  const Commentfield({this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ReadMoreText(
                text,
                colorClickableText: k_primarycolor,
                trimLength: 100,
                trimLines: 2,
              )),
        ));
  }
}
