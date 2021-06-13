import 'package:flutter/material.dart';
import 'package:mydream/components/circleavatar.dart';
import 'package:mydream/components/slideable.dart';
import 'package:mydream/components/texts.dart';
import 'package:mydream/constants/colours.dart';
import 'package:mydream/constants/decoration.dart';

class Reservationcard extends StatefulWidget {
  final String lawyername, date, time, address;

  const Reservationcard(
      {Key key, this.lawyername, this.date, this.time, this.address})
      : super(key: key);
  @override
  _ReservationcardState createState() => _ReservationcardState();
}

class _ReservationcardState extends State<Reservationcard> {
  double hight = double.infinity;
  double width = 353;
  double iconsize = 30;
  double padding = 10;
  @override
  Widget build(BuildContext context) {
    return SlideMenu(
      menuItems: <Widget>[
        FlatButton(
          onPressed: () {
            setState(() {
              hight = 0;
              width = 0;
              iconsize = 0;
              padding = 0;
            });
          },
          child: Goldtext(string: "Cancel"),
          color: Colors.transparent,
        )
      ],
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Container(
          width: width,
          height: hight,
          // color: koldpapper,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Goldcircleavatar(
                      size: 70,
                    ),
                  ),
                  Flexible(
                      child: Goldtext(
                    string: widget.lawyername,
                    fontWeight: FontWeight.w600,
                    fontsize: 25,
                  )),
                ],
              ),
              // SizedBox(height: 20,),
              // Text("name of the lawyer"),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 2,
                color: k_primarycolor,
                width: double.infinity,
              ),
              Resevationrow(
                label: "date",
                value: widget.date,
              ),
              Resevationrow(
                label: "Time",
                value: widget.time,
              ),
              Resevationrow(
                  label: "address",
                  value: "13 dr hassan ibrahim st madint nasr")
            ],
          ),
          decoration: kdecorationgoldaccent,
        ),
      ),
    );
  }
}

class Resevationrow extends StatelessWidget {
  final String label;
  final String value;
  const Resevationrow({@required this.label, @required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Reservationtext(
          text: label,
          label: true,
        ),
        Reservationtext(
          text: ":",
          label: false,
        ),
        Reservationtext(text: value, label: false),
      ],
    );
  }
}

class Reservationtext extends StatelessWidget {
  final String text;
  final bool label;
  const Reservationtext({@required this.text, @required this.label});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: label == true ? 10 : 0),
        child:
            Goldtext(string: text, fontWeight: FontWeight.w400, fontsize: 16),
      ),
    );
  }
}
