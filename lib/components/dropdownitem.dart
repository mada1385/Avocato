import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydream/constants/colours.dart';

class Dropdownmenu extends StatelessWidget {
  final List<String> items;
  final Function onchange;
  final String hint;
  Dropdownmenu({@required this.items, this.onchange, this.hint});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 90),
      child: Theme(
        data: ThemeData(canvasColor: k_backgroundcolor),
        child: new DropdownButton<String>(
          hint: Text(
            hint,
            style: TextStyle(color: k_thirdcolor ),
          ),
          isExpanded: true,
          iconDisabledColor: k_primarycolor,
          focusColor: k_primarycolor,
          iconEnabledColor: k_primarycolor,
          underline: DropdownButtonHideUnderline(
            child: Container(
              width: 100,
              color: k_primarycolor,
              height: 1,
            ),
          ),
          items: items.map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.symmetric(horizontal: 10),child: Container(child: Text(value,style: TextStyle(color: k_thirdcolor),))),
                      SizedBox(height: 2,),
                      Container(height: 1,color: k_primarycolor,)
                    ],
                  ),
                );
              }).toList(),
          onChanged: onchange,
        ),
      ),
    );
  }
}
