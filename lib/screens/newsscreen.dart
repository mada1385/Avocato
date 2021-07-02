import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mydream/components/newscard.dart';
import 'package:mydream/components/primarylistview.dart';
import 'package:mydream/constants/colours.dart';

class Newsscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
        stream: Firestore.instance.collection("post").snapshots(),
        builder: (context, snapshots) {
          if (snapshots.data == null)
            return Center(
                child: Theme(
                    data: ThemeData(accentColor: k_primarycolor),
                    child: CircularProgressIndicator()));
          else
            return Primarylistveiw(
                children: snapshots.data.documents
                    .map<Widget>((e) => Builder(
                          builder: (context) => Newscard(
                              name: e["user"]["full_name"], news: e["body"]),
                        ))
                    .toList());
        });
  }
}
