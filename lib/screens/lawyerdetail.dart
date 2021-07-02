import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mydream/components/commenttextfield.dart';
import 'package:mydream/components/primarybtn.dart';
import 'package:mydream/components/texts.dart';
import 'package:mydream/config/provider.dart';
import 'package:mydream/constants/colours.dart';
import 'package:mydream/constants/decoration.dart';
import 'package:mydream/screens/registaritionformscreen.dart';
import 'package:provider/provider.dart';

class Lawyerdetails extends StatefulWidget {
  dynamic lawyer;

  Lawyerdetails({Key key, this.lawyer}) : super(key: key);

  @override
  _LawyerdetailsState createState() => _LawyerdetailsState();
}

class _LawyerdetailsState extends State<Lawyerdetails> {
  bool more = false;
  List getmore() {
    if (widget.lawyer["reviews"] != null) {
      if (more)
        return widget.lawyer["reviews"];
      else {
        if (widget.lawyer["reviews"].length > 5) {
          return widget.lawyer["reviews"].getRange(0, 5).toList();
        } else
          return widget.lawyer["reviews"]
              .getRange(0, widget.lawyer["reviews"].length)
              .toList();
      }
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: k_backgroundcolor,
        appBar: AppBar(
          bottomOpacity: 0.0,
          backgroundColor: k_backgroundcolor,
          title: k_title,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: kdecorationgoldaccent,
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    CircleAvatar(
                      maxRadius: 60,
                      backgroundColor: k_primarycolor,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Goldtext(
                      string: widget.lawyer["full_name"],
                      fontsize: 30,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: k_primarycolor.withOpacity(1),
                                offset: Offset(0, 2),
                                blurRadius: 3)
                          ],
                          color: k_backgroundcolor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Goldtext(
                              string: widget.lawyer["lawfield"],
                              fontsize: 25,
                            ),
                            Row(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.monetization_on_outlined,
                                      color: k_primarycolor,
                                    ),
                                    Goldtext(
                                      string: num.parse(
                                              (widget.lawyer["hourrate"] ?? 0)
                                                  .toStringAsFixed(2))
                                          .toString(),
                                      fontsize: 25,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: k_primarycolor,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Goldtext(
                                      string: num.parse(
                                              (widget.lawyer["rate"] ?? 0)
                                                  .toStringAsFixed(2))
                                          .toString(),
                                      fontsize: 25,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 20),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: [
                    //       Icon(
                    //         Icons.location_on,
                    //         color: k_primarycolor,
                    //       ),
                    //       Goldtext(
                    //         string: widget.lawyer.address,
                    //         fontsize: 25,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Goldtext(
                            string: "Reviews",
                            fontsize: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) =>
                                      Sendreply(refrence: widget.lawyer),
                                  isScrollControlled: true);
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add,
                                  color: k_primarycolor,
                                ),
                                Goldtext(
                                  string: "add review",
                                  fontsize: 25,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: getmore()
                                  .map((e) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                88,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: k_primarycolor,
                                                    width: 2),
                                                color: koldpapper,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10),
                                                      child: Text(
                                                        e["user"]["full_name"],
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: Colors.grey),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 15),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width -
                                                            200,
                                                        child: Text(
                                                          e["review"],
                                                          // colorClickableText: k_primarycolor,
                                                          // trimLength: 100,
                                                          // trimLines: 2,
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Goldtext(
                                                          string: e["rate"]
                                                              .toStringAsFixed(
                                                                  2)
                                                              .toString(),
                                                          fontsize: 16,
                                                        ),
                                                        Icon(
                                                          Icons.star,
                                                          color: k_primarycolor,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )),
                                      ))
                                  .toList()),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            more = !more;
                          });
                        },
                        child: Goldtext(
                          string: widget.lawyer["reviews"] != null
                              ? "read more"
                              : "",
                          fontsize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Primarybtn(
                          expand: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Registerationform(
                                          lawyer: widget.lawyer,
                                        )));
                          },
                          category: "Register"),
                    ),
                    SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class Sendreply extends StatefulWidget {
  final dynamic refrence;

  Sendreply({Key key, this.refrence}) : super(key: key);

  @override
  _SendreplyState createState() => _SendreplyState();
}

class _SendreplyState extends State<Sendreply> {
  final replycontroller = TextEditingController();
  double rate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          height: 200,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            // borderRadius: BorderRadius.only(
            //     topLeft: Radius.circular(30.0),
            //     topRight: Radius.circular(30.0))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Goldtext(
                string: "Add a review",
                fontsize: 20,
              ),
              SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsetsDirectional.only(start: 10),
                child: Goldtext(
                  string: "Add a rate",
                  fontsize: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 10),
                child: Theme(
                  data: ThemeData(accentColor: k_primarycolor),
                  child: RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: k_primarycolor,
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        rate = rating;
                      });
                      print(rating);
                    },
                  ),
                ),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            // height: 41,
                            width: 140,
                            child: CommentCustomTextfield(
                              autofoucs: true,
                              controller: replycontroller,
                              validator: 0,
                              hint: "Add a review",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.send,
                        size: 20,
                        color: k_primarycolor,
                      ),
                      onPressed: () async {
                        Firestore.instance
                            .collection("lawyer")
                            .document(widget.refrence.reference.documentID)
                            .updateData({
                          "reviews": FieldValue.arrayUnion([
                            {
                              "user": Provider.of<Userprovider>(context,
                                      listen: false)
                                  .user,
                              "review": replycontroller.text,
                              "rate": rate,
                              "userid": Provider.of<Userprovider>(context,
                                      listen: false)
                                  .userid
                            }
                          ])
                        });
                        Provider.of<Userprovider>(context, listen: false)
                            .addrate(widget.refrence.reference.documentID);
                      })
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              // SizedBox(
              //   height: 15,
              // ),
              // Container(
              //   width: 304,
              //   height: 1,
              //   color: Color(0xffEEEEEE),
              // ),
            ],
          )),
    );
  }
}

class Sortingmodel extends StatefulWidget {
  const Sortingmodel({Key key}) : super(key: key);
  @override
  _SortingmodelState createState() => _SortingmodelState();
}

class _SortingmodelState extends State<Sortingmodel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: k_backgroundcolor,
      height: 300,
      child: Theme(
        data: Theme.of(context).copyWith(
            unselectedWidgetColor: k_primarycolor,
            disabledColor: k_primarycolor),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Row(
            children: [
              Radio(
                groupValue: Provider.of<Userprovider>(context).groupvalue,
                hoverColor: k_primarycolor,
                focusColor: k_primarycolor,
                activeColor: k_primarycolor,
                value: 0,
                onChanged: (int val) {
                  Provider.of<Userprovider>(context, listen: false)
                      .changegroupvalue(val);
                  Navigator.pop(context);
                  FocusScope.of(context).unfocus();
                },
              ),
              Text(
                "recomendations",
                style: TextStyle(fontSize: 12, color: k_primarycolor),
              ),
            ],
          ),
          Row(
            children: [
              Radio(
                groupValue: Provider.of<Userprovider>(context).groupvalue,
                hoverColor: k_primarycolor,
                focusColor: k_primarycolor,
                activeColor: k_primarycolor,
                value: 1,
                onChanged: (int val) {
                  Provider.of<Userprovider>(context, listen: false)
                      .changegroupvalue(val);
                  FocusScope.of(context).unfocus();
                },
              ),
              Text(
                "hourly rate  Ascending",
                style: TextStyle(fontSize: 12, color: k_primarycolor),
              ),
            ],
          ),
          Row(
            children: [
              Radio(
                groupValue: Provider.of<Userprovider>(context).groupvalue,
                hoverColor: k_primarycolor,
                focusColor: k_primarycolor,
                activeColor: k_primarycolor,
                value: 2,
                onChanged: (int val) {
                  Provider.of<Userprovider>(context, listen: false)
                      .changegroupvalue(val);
                  FocusScope.of(context).unfocus();
                },
              ),
              Text(
                "hourly rate descending",
                style: TextStyle(fontSize: 12, color: k_primarycolor),
              ),
            ],
          ),
          Row(
            children: [
              Radio(
                groupValue: Provider.of<Userprovider>(context).groupvalue,
                hoverColor: k_primarycolor,
                focusColor: k_primarycolor,
                activeColor: k_primarycolor,
                value: 3,
                onChanged: (int val) {
                  Provider.of<Userprovider>(context, listen: false)
                      .changegroupvalue(val);
                  FocusScope.of(context).unfocus();
                },
              ),
              Text(
                "A-Z Ascending",
                style: TextStyle(fontSize: 12, color: k_primarycolor),
              ),
            ],
          ),
          Row(
            children: [
              Radio(
                groupValue: Provider.of<Userprovider>(context).groupvalue,
                hoverColor: k_primarycolor,
                focusColor: k_primarycolor,
                activeColor: k_primarycolor,
                value: 4,
                onChanged: (int val) {
                  Provider.of<Userprovider>(context, listen: false)
                      .changegroupvalue(val);
                  Navigator.pop(context);
                  FocusScope.of(context).unfocus();
                },
              ),
              Text(
                "A-Z descending",
                style: TextStyle(fontSize: 12, color: k_primarycolor),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

// class Sendreply extends StatelessWidget {
//   final replycontroller = TextEditingController();
//   final String refrence;

//   Sendreply({Key key, this.refrence}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 200,
//         color: Color(0xff757575),
//         child: Padding(
//             padding: EdgeInsets.only(
//                 bottom: MediaQuery.of(context).viewInsets.bottom),
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 10.0),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 // borderRadius: BorderRadius.only(
//                 //     topLeft: Radius.circular(30.0),
//                 //     topRight: Radius.circular(30.0))
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Goldtext(
//                     string: "Add a review",
//                     fontsize: 20,
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),

//                   Padding(
//                     padding: const EdgeInsetsDirectional.only(start: 10),
//                     child: Goldtext(
//                       string: "Add a rate",
//                       fontsize: 16,
//                     ),
//                   ),
//                   Theme(
//                     data: ThemeData(accentColor: k_primarycolor),
//                     child: RatingBar.builder(
//                       initialRating: 3,
//                       minRating: 1,
//                       direction: Axis.horizontal,
//                       allowHalfRating: true,
//                       itemCount: 5,
//                       itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
//                       itemBuilder: (context, _) => Icon(
//                         Icons.star,
//                         color: k_primarycolor,
//                       ),
//                       onRatingUpdate: (rating) {
//                         print(rating);
//                       },
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       Row(
//                         children: [
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Container(
//                                 height: 41,
//                                 width: 140,
//                                 child: CommentCustomTextfield(
//                                   autofoucs: true,
//                                   controller: replycontroller,
//                                   validator: 0,
//                                   hint: "Add A Reply",
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 7.5,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       IconButton(
//                           icon: Icon(
//                             Icons.send,
//                             size: 20,
//                             color: k_primarycolor,
//                           ),
//                           onPressed: () async {
//                             Firestore.instance
//                                 .collection("lawyer")
//                                 .document(refrence)
//                                 .updateData({
//                               "replies": FieldValue.arrayUnion([
//                                 {
//                                   "user": Provider.of<Userprovider>(context,
//                                           listen: false)
//                                       .user,
//                                   "reply": replycontroller.text,
//                                   "endoresment": 0,
//                                   "time": DateTime.now().toString(),
//                                   "lawyerid": Provider.of<Userprovider>(context,
//                                           listen: false)
//                                       .userid,
//                                 }
//                               ])
//                             }).then((value) => Provider.of<Userprovider>(
//                                         context,
//                                         listen: false)
//                                     .addreplies());
//                           })
//                     ],
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   ),
//                   // SizedBox(
//                   //   height: 15,
//                   // ),
//                   // Container(
//                   //   width: 304,
//                   //   height: 1,
//                   //   color: Color(0xffEEEEEE),
//                   // ),
//                 ],
//               ),
//             )));
//   }
// }
