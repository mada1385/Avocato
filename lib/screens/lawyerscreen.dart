import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydream/components/texts.dart';
import 'package:mydream/config/provider.dart';
import 'package:mydream/constants/colours.dart';
import 'package:mydream/constants/decoration.dart';
import 'package:mydream/screens/lawyerdetail.dart';
import 'package:provider/provider.dart';

class Lawyerscreen extends StatelessWidget {
  final String area, city, lawfield;

  Lawyerscreen({Key key, this.area, this.city, this.lawfield})
      : super(key: key);
  List getrecommend(List lawyers) {
    List recommend = lawyers;
    recommend.sort((a, b) => b["totalrate"].compareTo(a["totalrate"]));
    print("==========>$recommend");
    return recommend
        .getRange(
            0,
            recommend.length == 1
                ? 1
                : recommend.length == 2
                    ? 2
                    : 3)
        .toList();
  }

  List getothers(List lawyers, BuildContext context) {
    List recommend = lawyers;
    if (Provider.of<Userprovider>(context).groupvalue == 0)
      recommend.sort((a, b) => b["totalrate"].compareTo(a["totalrate"]));
    else if (Provider.of<Userprovider>(context).groupvalue == 1)
      recommend.sort((a, b) => b["hourrate"].compareTo(a["hourrate"]));
    else if (Provider.of<Userprovider>(context).groupvalue == 2)
      recommend.sort((a, b) => a["hourrate"].compareTo(b["hourrate"]));
    else if (Provider.of<Userprovider>(context).groupvalue == 3)
      recommend.sort((a, b) => b["full_name"].compareTo(a["full_name"]));
    else if (Provider.of<Userprovider>(context).groupvalue == 4)
      recommend.sort((a, b) => a["full_name"].compareTo(b["full_name"]));

    print("==========>$recommend");
    return Provider.of<Userprovider>(context).groupvalue == 0
        ? recommend
            .getRange(
                recommend.length == 1
                    ? 1
                    : recommend.length == 2
                        ? 2
                        : 3,
                recommend.length)
            .toList()
        : recommend;
  }

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
              .where(
                "lawfield",
                isEqualTo: lawfield,
              )
              .where("area", isEqualTo: area)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data == null)
              return Center(
                  child: Theme(
                      data: ThemeData(accentColor: k_primarycolor),
                      child: CircularProgressIndicator()));
            else
              // print(snapshot.data.documents);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Sortingmodel(),
                          isScrollControlled: true,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(start: 20),
                        child: Icon(
                          Icons.filter_list,
                          color: k_primarycolor,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Provider.of<Userprovider>(context).groupvalue == 0
                            ? Column(
                                children: getrecommend(snapshot.data.documents)
                                    .map<Widget>((e) => Builder(
                                        builder: (context) => GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Lawyerdetails(
                                                              lawyer: e,
                                                            )));
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 10),
                                                child: Container(
                                                    width: double.infinity,
                                                    decoration:
                                                        kdecorationgoldaccent,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
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
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child:
                                                                      CircleAvatar(
                                                                    maxRadius:
                                                                        40,
                                                                    backgroundColor:
                                                                        k_primarycolor,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
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
                                                                        fontsize:
                                                                            20,
                                                                      ),
                                                                      Goldtext(
                                                                        string:
                                                                            e["lawfield"],
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontsize:
                                                                            20,
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Icon(
                                                                            Icons.monetization_on_outlined,
                                                                            color:
                                                                                k_primarycolor,
                                                                          ),
                                                                          Goldtext(
                                                                            string:
                                                                                num.parse((e["hourrate"] ?? 0).toStringAsFixed(2)).toString(),
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontsize:
                                                                                20,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Icon(
                                                                            Icons.star,
                                                                            color:
                                                                                k_primarycolor,
                                                                          ),
                                                                          Goldtext(
                                                                            string:
                                                                                num.parse((e["rate"] ?? 0).toStringAsFixed(2)).toString(),
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontsize:
                                                                                20,
                                                                          ),
                                                                          Goldtext(
                                                                            string:
                                                                                "Recomended",
                                                                            fontsize:
                                                                                20,
                                                                          )
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
                                                              Icons
                                                                  .chevron_right,
                                                              color:
                                                                  k_primarycolor,
                                                              size: 50,
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    )),
                                              ),
                                            )))
                                    .toList())
                            : Container(),
                        Column(
                            children:
                                getothers(snapshot.data.documents, context)
                                    .map<Widget>((e) => Builder(
                                        builder: (context) => GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Lawyerdetails(
                                                              lawyer: e,
                                                            )));
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 10),
                                                child: Container(
                                                    width: double.infinity,
                                                    decoration:
                                                        kdecorationgoldaccent,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
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
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child:
                                                                      CircleAvatar(
                                                                    maxRadius:
                                                                        40,
                                                                    backgroundColor:
                                                                        k_primarycolor,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
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
                                                                        fontsize:
                                                                            20,
                                                                      ),
                                                                      Goldtext(
                                                                        string:
                                                                            e["lawfield"],
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontsize:
                                                                            20,
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Icon(
                                                                            Icons.star,
                                                                            color:
                                                                                k_primarycolor,
                                                                          ),
                                                                          Goldtext(
                                                                            string:
                                                                                num.parse((e["rate"] ?? 0).toStringAsFixed(2)).toString(),
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontsize:
                                                                                20,
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
                                                              Icons
                                                                  .chevron_right,
                                                              color:
                                                                  k_primarycolor,
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
                    ),
                  ),
                ],
              );
          }),
    );
  }
}
