import 'package:flutter/material.dart';
import 'package:mydream/components/coulmnbuilder.dart';
import 'package:mydream/components/primarybtn.dart';
import 'package:mydream/components/subbtn.dart';

class Subbtns extends StatefulWidget {
  final String category;
  // final List<String> subcategories;

  Function expand;
  Subbtns({
    @required this.category,
    @required this.expand,
  });

  @override
  _SubbtnsState createState() => _SubbtnsState();
}

class _SubbtnsState extends State<Subbtns> {
  bool buttonhight = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Primarybtn(expand: widget.expand, category: widget.category),
              // ColumnBuilder(
              //     itemBuilder: (context, index) {
              //       return Subbtn(
              //         label: widget.subcategories[index],
              //         firstbuttonhight: buttonhight,
              //       );
              //     },
              //     itemCount: widget.subcategories.length)
            ],
          ),
        ],
      ),
    );
  }
}
