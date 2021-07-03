import 'package:flutter/material.dart';
import 'package:mydream/constants/colours.dart';
import 'package:mydream/screens/otherconsutltaion.dart';
import 'package:mydream/screens/userconsultation.dart';

class Consultaationscreen extends StatefulWidget {
  @override
  List screens = <Widget>[
    Otherconsultataion(),
    Userconsutation(),
  ];
  int screencontrol = 0;
  _ConsultaationscreenState createState() => _ConsultaationscreenState();
}

class _ConsultaationscreenState extends State<Consultaationscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: k_backgroundcolor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    setState(() {
                      widget.screencontrol = 0;
                      print(widget.screencontrol);
                    });
                  },
                  color: widget.screencontrol == 0
                      ? k_primarycolor
                      : k_backgroundcolor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      "others consultation",
                      style: TextStyle(
                          color: widget.screencontrol == 0
                              ? k_backgroundcolor
                              : k_primarycolor),
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      widget.screencontrol = 1;
                      print(widget.screencontrol);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text("your consultaton",
                        style: TextStyle(
                            color: widget.screencontrol == 1
                                ? k_backgroundcolor
                                : k_primarycolor)),
                  ),
                  color: widget.screencontrol == 1
                      ? k_primarycolor
                      : k_backgroundcolor,
                ),
              ],
            ),
            Container(
              child: widget.screens[widget.screencontrol],
            )
          ],
        ),
      ),
    );
  }
}
