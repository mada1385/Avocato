import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mydream/components/consultaincard.dart';
import 'package:mydream/components/consultaioncategory.dart';
import 'package:mydream/components/primarylistview.dart';
import 'package:mydream/config/provider.dart';
import 'package:provider/provider.dart';

class Otherconsultataion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: StreamBuilder(
            stream: Firestore.instance.collection("cases").snapshots(),
            builder: (context, snapshot) {
              return Primarylistveiw(
                  children: snapshot.data.documents
                      .map<Widget>((e) => Consultaioncard(
                            concult: e["case"],
                            username: e["usermail"],
                            firstbuttonhight: true,
                          ))
                      .toList());
            }));
  }
}
