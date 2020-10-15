import 'package:flutter/material.dart';
import 'package:mydream/constants/colours.dart';

class Subbtn extends StatelessWidget {
  const Subbtn({this.firstbuttonhight= false, @required this.label});
  final String label;
  final bool firstbuttonhight;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 1),
        child: GestureDetector(
            child: Container(
          child: Text(
            label,
            style: TextStyle(color: Colors.grey),
          ),
          height: firstbuttonhight == false ? 0 : 40,
          width: double.infinity,
          decoration: BoxDecoration(
            color:koldpapper, 
            // Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: k_primarycolor,
            ),
          ),
        )));
  }
}