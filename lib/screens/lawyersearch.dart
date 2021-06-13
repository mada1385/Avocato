import 'package:flutter/material.dart';
import 'package:mydream/components/dropdownitem.dart';
import 'package:mydream/components/primaryiconbtn.dart';
import 'package:mydream/constants/colours.dart';
import 'package:mydream/screens/lawscreen.dart';
import 'package:mydream/screens/lawyerscreen.dart';

class Lawyersearch extends StatefulWidget {
  @override
  _LawyersearchState createState() => _LawyersearchState();
}

class _LawyersearchState extends State<Lawyersearch> {
  String lawfield, city, area;
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
                    value: lawfield,
                    onchange: (val) {
                      setState(() {
                        lawfield = val;
                      });
                    },
                    items: [
                      'Admiralty',
                      'Bankruptcy',
                      'Business',
                      'Civil Rights'
                    ],
                    hint: "select law field",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Dropdownmenu(
                    value: city,
                    onchange: (val) {
                      setState(() {
                        city = val;
                      });
                    },
                    items: ['cairo', 'alexandria'],
                    hint: "select your city",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  city == ""
                      ? Container()
                      : Dropdownmenu(
                          value: area,
                          items: city == "cairo"
                              ? ["maadi", "new cairo", "helwan"]
                              : ["roshdy"],
                          onchange: (val) {
                            setState(() {
                              area = val;
                            });
                          },
                          hint: "select your area",
                        ),
                  SizedBox(
                    height: 20,
                  ),
                  PrimaryIconButton(
                      icons: Icons.search,
                      func: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Lawyerscreen(
                                      lawfield: lawfield,
                                      city: city,
                                      area: area,
                                    )));
                      }),
                ])));
  }
}
