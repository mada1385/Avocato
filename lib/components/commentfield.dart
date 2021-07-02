import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mydream/components/circleavatar.dart';
import 'package:mydream/components/readmore.dart';
import 'package:mydream/config/provider.dart';
import 'package:mydream/constants/colours.dart';
import 'package:provider/provider.dart';

import 'circleavatar.dart';

class Commentfield extends StatefulWidget {
  final dynamic e;
  final ref;
  const Commentfield({this.e, this.ref});

  @override
  _CommentfieldState createState() => _CommentfieldState();
}

class _CommentfieldState extends State<Commentfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Goldcircleavatar(size: 50),
                      ),
                      Text(widget.e["user"]["full_name"])
                    ],
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.only(start: 70, top: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width * .50,
                        child: ReadMoreText(
                          widget.e["reply"],
                          colorClickableText: k_primarycolor,
                          trimLength: 100,
                          trimLines: 2,
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(end: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        print(widget.ref);
                        final res = await Firestore.instance
                            .collection("cases")
                            .document(widget.ref)
                            .get();
                        List replies = res.data["replies"];

                        for (dynamic reply in replies) {
                          if (reply["time"] == widget.e["time"]) {
                            setState(() {
                              print("=====>${reply["endoresment"]}");
                              num i = reply["endoresment"];
                              i += 1;
                              reply["endoresment"] = i;
                              print("=====>${reply["endoresment"]}");
                            });
                            break;
                          }
                        }
                        await Firestore.instance
                            .collection("cases")
                            .document(widget.ref)
                            .updateData({"replies": replies});
                        Provider.of<Userprovider>(context, listen: false)
                            .addendoresment(widget.e["lawyerid"], true);
                      },
                      child: Icon(
                        Icons.thumb_up,
                        color: k_primarycolor,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(widget.e["endoresment"].toString()),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () async {
                        print(widget.ref);
                        final res = await Firestore.instance
                            .collection("cases")
                            .document(widget.ref)
                            .get();
                        List replies = res.data["replies"];

                        for (dynamic reply in replies) {
                          if (reply["time"] == widget.e["time"]) {
                            setState(() {
                              print("=====>${reply["endoresment"]}");
                              num i = reply["endoresment"];
                              i -= 1;
                              reply["endoresment"] = i;
                              print("=====>${reply["endoresment"]}");
                            });

                            break;
                          }
                        }
                        await Firestore.instance
                            .collection("cases")
                            .document(widget.ref)
                            .updateData({"replies": replies});
                        Provider.of<Userprovider>(context, listen: false)
                            .addendoresment(widget.e["lawyerid"], false);
                      },
                      child: Icon(
                        Icons.thumb_down,
                        color: k_primarycolor,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
