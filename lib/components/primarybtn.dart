import 'package:flutter/material.dart';
import 'package:mydream/components/texts.dart';
import 'package:mydream/constants/colours.dart';

class Primarybtn extends StatelessWidget {
  final Function expand;
  final String category ;
  Primarybtn({@required this.expand,@required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: GestureDetector(
          onTap: expand,
          child: Container(
            child: Center(child: Goldtext(string: category,)),
            height: 60,
            decoration: BoxDecoration(
              color: k_backgroundcolor,
              border: Border.all(color: k_primarycolor,width: 2),
              // (0xff63482B),
              // (0xff432918),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              // border: Border.all(
              //   color: k_primarycolor,
              // ),
            ),
            width: double.infinity,
          )),
    );
  }
}