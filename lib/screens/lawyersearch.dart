import 'package:flutter/material.dart';
import 'package:mydream/components/dropdownitem.dart';
import 'package:mydream/components/primaryiconbtn.dart';
import 'package:mydream/constants/colours.dart';

class Lawyersearch extends StatefulWidget {
  @override
  _LawyersearchState createState() => _LawyersearchState();
}

class _LawyersearchState extends State<Lawyersearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: k_backgroundcolor,
       body: Container(
          constraints: BoxConstraints.expand(),
          color: k_backgroundcolor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Dropdownmenu(
                items: ['A', 'B', 'C', 'D'],
                onchange: (_) {},
                hint: "select law field",
              ),
              SizedBox(
                height: 10,
              ),
              Dropdownmenu(
                items: ['A', 'B', 'C', 'D'],
                onchange: (_) {},
                hint: "select your city",
              ),
              SizedBox(
                height: 10,
              ),
              Dropdownmenu(
                items: ['A', 'B', 'C', 'D'],
                onchange: (_) {},
                hint: "select your area",
              ),
              SizedBox(
                height: 20,
              ),
            PrimaryIconButton(icons: Icons.search, func: null),
            ]
          ))) ;
  }
}
