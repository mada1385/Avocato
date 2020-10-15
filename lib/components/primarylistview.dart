
import 'package:flutter/material.dart';
import 'package:mydream/constants/colours.dart';

class Primarylistveiw extends StatelessWidget {
  final List <Widget> children  ;
  const Primarylistveiw({
    @required this.children
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Theme(data: Theme.of(context).copyWith(
    accentColor: k_primarycolor,
        ),
            child: ListView(
      children: children,
    ),
        ),
      );
  }
}