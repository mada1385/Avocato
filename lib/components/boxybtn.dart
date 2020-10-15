import 'package:flutter/material.dart';
import 'package:mydream/components/texts.dart';
import 'package:mydream/constants/colours.dart';

class Boxybtn extends StatelessWidget {
   final Function func;
  final String label ;
  Boxybtn({@required this.func,@required this.label});
  
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical:7.5),
      child: GestureDetector(
          onTap: func,
          child: Container(
            child: Center(child: Goldtext(string: label
        ,)),
            height: 60,
            decoration: BoxDecoration(
              color: k_backgroundcolor,
              border: Border.all(color: k_primarycolor,width: 2),
              borderRadius: BorderRadius.all(Radius.circular(5)),
              
              // (0xff63482B),
              // (0xff432918),
              
              // border: Border.all(
              //   color: k_primarycolor,
              // ),
            ),
            width: double.infinity,
          )),
    );
  }
}