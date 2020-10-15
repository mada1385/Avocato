import 'package:flutter/material.dart';
import 'package:mydream/components/newscard.dart';
import 'package:mydream/components/primarylistview.dart';
import 'package:mydream/constants/colours.dart';

class Newsscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Primarylistveiw(
      children: <Widget>[
        SizedBox(
          height: 15,
        ),
        Newscard(),
        Newscard(),
        Newscard(),
        Newscard(),
        Newscard(),
      ],
    );
  }
}
