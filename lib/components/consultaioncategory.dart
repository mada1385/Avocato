import 'package:flutter/material.dart';
import 'package:mydream/components/consultaincard.dart';
import 'package:mydream/components/coulmnbuilder.dart';
import 'package:mydream/components/newscard.dart';
import 'package:mydream/components/primarybtn.dart';
import 'package:mydream/components/boxybtn.dart';

class Consutationoption extends StatefulWidget {
  final String category;
  final List list = <int>[1, 2, 2, 4];

  Function expand;
  Consutationoption({
    @required this.category,
    // @required this.subcategories,
    // @required this.expand,
  });

  @override
  _ConsutationoptionState createState() => _ConsutationoptionState();
}

class _ConsutationoptionState extends State<Consutationoption> {
  bool buttonhight = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.,
        children: <Widget>[
          Column(
            children: <Widget>[
              Boxybtn(
                  func: () {
                    setState(() {
                      buttonhight = !buttonhight;
                    });
                  },
                  label: widget.category),
              ColumnBuilder(
                  itemBuilder: (context, index) {
                    return Consultaioncard(
                      firstbuttonhight: buttonhight,
                    );
                  },
                  itemCount: widget.list.length)
            ],
          ),
        ],
      ),
    );
  }
}
