import 'package:flutter/material.dart';
import 'package:mydream/constants/colours.dart';

class Primarytextfield extends StatelessWidget {
  final String hint ;
  Primarytextfield({this.hint,this.onchange}) ;
  final Function onchange ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 80, left: 80),
      child: TextField(
        onChanged: onchange,
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: k_primarycolor),
              //  when the TextFormField in unfocused
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: k_primarycolor),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: k_primarycolor),
            ),
            hintText: hint ,
            hintStyle: TextStyle(
              color: Colors.grey,
            )),
        textAlign: TextAlign.center,
        cursorColor: k_primarycolor,
      ),
    );
  }
}