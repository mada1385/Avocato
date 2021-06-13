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
          return Primarylistveiw(
              children: snapshots.data.documents
                  .map<Widget>((e) => Builder(
                        builder: (context) =>
                            Newscard(name: e["user"], news: e["body"]),
                      ))
                  .toList());
        });
  }
}
