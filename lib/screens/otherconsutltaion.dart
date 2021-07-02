import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mydream/components/consultaincard.dart';
import 'package:mydream/components/consultaioncategory.dart';
import 'package:mydream/components/primarylistview.dart';
import 'package:mydream/config/provider.dart';
import 'package:mydream/constants/colours.dart';
import 'package:provider/provider.dart';

class Otherconsultataion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: StreamBuilder(
            stream: Firestore.instance.collection("cases").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.data == null)
                return Center(
                    child: Theme(
                        data: ThemeData(accentColor: k_primarycolor),
                        child: CircularProgressIndicator()));
              else
                return Primarylistveiw(
                    children: snapshot.data.documents
                        .map<Widget>((e) => Consultaioncard(
                              refrence: e.reference.documentID,
                              concult: e["case"],
                              username: e["user"]["full_name"],
                              firstbuttonhight: true,
                              replies: e["replies"],
                            ))
                        .toList());
            }));
  }
}
