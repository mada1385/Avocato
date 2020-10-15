import 'package:flutter/material.dart';
import 'package:mydream/components/consultaioncategory.dart';
import 'package:mydream/components/primarylistview.dart';

class Otherconsultataion  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: Primarylistveiw(
            children: <Widget>[
              Consutationoption(category: "murder"),
              Consutationoption(category: "murder"),
              Consutationoption(category: "murder"),
              Consutationoption(category: "murder"),
              Consutationoption(category: "murder"),
              Consutationoption(category: "murder"),
              Consutationoption(category: "murder"),
              Consutationoption(category: "murder"),
              Consutationoption(category: "murder"),
              Consutationoption(category: "murder"),
              Consutationoption(category: "murder"),
              Consutationoption(category: "murder"),
              Consutationoption(category: "murder"),
              Consutationoption(category: "murder"),
            ],
          ),
    );
  }
}