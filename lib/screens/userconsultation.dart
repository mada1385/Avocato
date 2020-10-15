import 'package:flutter/material.dart';
import 'package:mydream/components/consultaincard.dart';
import 'package:mydream/components/primarybtn.dart';
import 'package:mydream/components/primaryiconbtn.dart';
import 'package:mydream/components/primarylistview.dart';
import 'package:mydream/components/primarytextfield.dart';
import 'package:mydream/constants/colours.dart';

class Userconsutation extends StatefulWidget {
  bool flag = false;
  @override
  _UserconsutationState createState() => _UserconsutationState();
}

class _UserconsutationState extends State<Userconsutation> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  PrimaryIconButton(
                    func: () {
                      setState(() {
                        widget.flag = !widget.flag;
                      });
                    },
                    icons: widget.flag == false ? Icons.add : Icons.close,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: widget.flag == false
                ? EdgeInsets.all(0)
                : EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: widget.flag == false
                ? Container(
                    height: 0,
                    width: 0,
                  )
                : Container(
                  decoration: BoxDecoration(

                    color: k_primarycolor,
                    borderRadius: BorderRadius.all(Radius.circular(5))

                  ),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 100,
                            width: double.infinity,
                            color:koldpapper,
                            child:  Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Primarytextfield(hint: "state your case",),
                              ],
                            ),
                            
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Primarybtn(category: "post",expand: (){},),
                          )
                        ],
                      ),
                    ),
                  ),
          ),
          Expanded(
              child: Primarylistveiw(
            children: <Widget>[
              Consultaioncard(
                firstbuttonhight: true,
              ),
              Consultaioncard(
                firstbuttonhight: true,
              ),
              Consultaioncard(
                firstbuttonhight: true,
              ),
              Consultaioncard(
                firstbuttonhight: true,
              ),
              Consultaioncard(
                firstbuttonhight: true,
              ),
            ],
          )),
        ],
      ),
    );
  }
}
