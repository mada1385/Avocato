import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mydream/components/commentfield.dart';
import 'package:mydream/components/readmore.dart';
import 'package:mydream/constants/colours.dart';
import 'package:mydream/constants/decoration.dart';

import 'circleavatar.dart';

class Consultaioncard extends StatelessWidget {
  const Consultaioncard({
    this.firstbuttonhight = false,
  });
  // final String label;
  final bool firstbuttonhight;

  @override
  Widget build(BuildContext context) {
    return firstbuttonhight == false
        ? Container(
            height: 0,
            width: 0,
          )
        : Padding(
          padding: const EdgeInsets.symmetric(vertical:10 , horizontal: 5),
          child: Container(
            
              child: Column(
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
                        child: Text(
                            "Lorem Ipsum is simply dummy text of the printing "),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.transparent,
                      child: ReadMoreText(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                        colorClickableText: k_primarycolor,
                      ),
                      // "hello")
                    ),
                  ),
                  //  Container(
                  //   height: 2,
                  //   width: double.infinity,
                  //   color: k_primarycolor,
                  // ),
                  // SizedBox(height: 7.5,),
                  Commentfield(
                    text:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  ),
                  Commentfield(
                    text:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  )
                ],
              ),
              //  height: firstbuttonhight == false ? 0 :
              width: double.infinity,
              decoration: kdecorationconsultaion,
              //  BoxDecoration(
              //   color: koldpapper,
              //   borderRadius: BorderRadius.all(Radius.circular(10)),
              //   border: Border.all(
              //     color: k_primarycolor,
              //   ),
              // ),
            ),
        );

    //  Padding(
    //     padding: EdgeInsets.symmetric(horizontal: 15, vertical: 1),
    //     child: GestureDetector(
    //         child: Container(
    //       child: Text(
    //         label,
    //         style: TextStyle(color: Colors.grey),
    //       ),
    //       height: firstbuttonhight == false ? 0 : 40,
    //       width: double.infinity,
    //       decoration: BoxDecoration(
    //         color:koldpapper,
    //         // Colors.white,
    //         borderRadius: BorderRadius.all(Radius.circular(10)),
    //         border: Border.all(
    //           color: k_primarycolor,
    //         ),
    //       ),
    //     )));
  }
}
