import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydream/components/primarybtn.dart';
import 'package:mydream/components/texts.dart';
import 'package:mydream/constants/colours.dart';
import 'package:mydream/constants/decoration.dart';
import 'package:mydream/models/review.dart';
import 'package:mydream/screens/registaritionformscreen.dart';

class Lawyerdetails extends StatefulWidget {
  final dynamic lawyer;

  const Lawyerdetails({Key key, this.lawyer}) : super(key: key);
  @override
  _LawyerdetailsState createState() => _LawyerdetailsState();
}

class _LawyerdetailsState extends State<Lawyerdetails> {
  bool more = false;

  List<Review> review = [
    Review("1", "mohamed", "5",
        "best lawyer ever best lawyer ever best lawyer ever best lawyer ever best lawyer ever best lawyer ever best lawyer ever best lawyer ever best lawyer ever "),
    Review("1", "mohamed", "5", "best lawyer ever"),
    Review("1", "mohamed", "5", "best lawyer ever"),
    Review("1", "mohamed", "5", "best lawyer ever"),
    Review("1", "mohamed", "5", "best lawyer ever"),
    Review("1", "mohamed", "5", "best lawyer ever"),
    Review("1", "mohamed", "5", "best lawyer ever"),
    Review("1", "mohamed", "5", "best lawyer ever"),
  ];

  List<Review> getmore() {
    if (more)
      return review;
    else
      return review.getRange(0, 5).toList();
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
                            string: widget.lawyer["category"],
                            fontsize: 25,
                          ),
                          Row(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Goldtext(
                                    string: widget.lawyer["rate"].toString(),
                                    fontsize: 25,
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
                      children: [
                        Goldtext(
                          string: "Reviews",
                          fontsize: 30,
                        ),
                      ],
                    ),
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
                                                      e.name,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.grey),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 15),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width -
                                                              122,
                                                      child: Text(
                                                        e.comment,
                                                        // colorClickableText: k_primarycolor,
                                                        // trimLength: 100,
                                                        // trimLines: 2,
                                                      ),
                                                    ),
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
                        string: "read more",
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
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
