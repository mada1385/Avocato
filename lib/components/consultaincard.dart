import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mydream/components/commentfield.dart';
import 'package:mydream/components/readmore.dart';
import 'package:mydream/constants/colours.dart';
import 'package:mydream/constants/decoration.dart';

import 'circleavatar.dart';

class Consultaioncard extends StatelessWidget {
  const Consultaioncard({
    this.firstbuttonhight = false,
    this.concult,
    this.username,
    this.replies,
    this.refrence,
  });
  final String refrence;
  final List replies;
  final bool firstbuttonhight;
  final String concult, username;

  @override
  Widget build(BuildContext context) {
    return firstbuttonhight == false
        ? Container(
            height: 0,
            width: 0,
          )
        : GestureDetector(
            onLongPress: () => showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => Container(
                      height: 100,
                      child: Center(
                        child: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: k_primarycolor,
                          ),
                          onPressed: () {
                            Firestore.instance
                                .collection("cases")
                                .document(refrence)
                                .delete();
                          },
                        ),
                      ),
                    ),
                isScrollControlled: true),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Goldcircleavatar(
                          size: 60,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Flexible(
                            child: Container(
                          child: Text(username),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 2,
                      width: double.infinity,
                      color: k_primarycolor,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        color: Colors.transparent,
                        child: ReadMoreText(
                          concult,
                          colorClickableText: k_primarycolor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: replies == null
                              ? []
                              : replies
                                  .map<Widget>((e) => Builder(
                                        builder: (context) => Commentfield(
                                          e: e,
                                          ref: refrence,
                                        ),
                                      ))
                                  .toList()),
                    )
                  ],
                ),
                width: double.infinity,
                decoration: kdecorationconsultaion,
              ),
            ),
          );
  }
}
