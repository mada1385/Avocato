import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydream/components/texts.dart';
import 'package:mydream/constants/colours.dart';
import 'package:mydream/constants/decoration.dart';
import 'package:mydream/models/lawyermodel.dart';
import 'package:mydream/screens/lawyerdetail.dart';

class Lawyerscreen extends StatelessWidget {
  final String area, city, lawfield;
  List<Lawyer> lawyers = [
    Lawyer(
        name: "mohamed",
        address: "151 maadi",
        specialization: "crime",
        isrecomend: true,
        id: "1",
        rate: "4"),
    Lawyer(
        name: "mohamed",
        address: "151 maadi",
        specialization: "crime",
        id: "1",
        rate: "4"),
    Lawyer(
        name: "mohamed",
        address: "151 maadi",
        specialization: "crime",
        id: "1",
        rate: "4"),
    Lawyer(
        isrecomend: true,
        name: "mohamed",
        address: "151 maadi",
        specialization: "crime",
        id: "1",
        rate: "4"),
    Lawyer(
        name: "mohamed",
        address: "151 maadi",
        specialization: "crime",
        id: "1",
        rate: "4"),
    Lawyer(
        isrecomend: true,
        name: "mohamed",
        address: "151 maadi",
        specialization: "crime",
        id: "1",
        rate: "4"),
    Lawyer(
        name: "mohamed",
        address: "151 maadi",
        specialization: "crime",
        id: "1",
        rate: "4"),
    Lawyer(
        name: "mohamed",
        address: "151 maadi",
        specialization: "crime",
        id: "1",
        rate: "4"),
  ];

  Lawyerscreen({Key key, this.area, this.city, this.lawfield})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff282828),
      appBar: AppBar(
        bottomOpacity: 0.0,
        backgroundColor: k_backgroundcolor,
        title: k_title,
      ),
      body: StreamBuilder(
          stream: Firestore.instance
              .collection("lawyer")
              .where("city", isEqualTo: city)
              .snapshots(),
          builder: (context, snapshot) {
            print(snapshot.data.documents);
            return ListView(
              children: [
                Column(
                    children: snapshot.data.documents
                        .map<Widget>((e) => Builder(
                            builder: (context) => GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Lawyerdetails(
                                                  lawyer: e,
                                                )));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: Container(
                                        width: double.infinity,
                                        decoration: kdecorationgoldaccent,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: CircleAvatar(
                                                        maxRadius: 40,
                                                        backgroundColor:
                                                            k_primarycolor,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Goldtext(
                                                            string:
                                                                e["full_name"],
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontsize: 20,
                                                          ),
                                                          Goldtext(
                                                            string:
                                                                e["category"],
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontsize: 20,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons.star,
                                                                color:
                                                                    k_primarycolor,
                                                              ),
                                                              Goldtext(
                                                                string: e[
                                                                        "rate"]
                                                                    .toString(),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontsize: 20,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    // e.isrecomend == null
                                                    //     ? Container()
                                                    //     : e.isrecomend
                                                    //         ? Container(
                                                    //             child: Goldtext(
                                                    //               string:
                                                    //                   "recomended",
                                                    //               fontsize: 12,
                                                    //             ),
                                                    //           )
                                                    //         : Container()
                                                  ],
                                                ),
                                                Icon(
                                                  Icons.chevron_right,
                                                  color: k_primarycolor,
                                                  size: 50,
                                                )
                                              ],
                                            ),
                                          ],
                                        )),
                                  ),
                                )))
                        .toList())
              ],
            );
          }),
    );
  }
}
