import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mydream/components/reservationcard.dart';
import 'package:mydream/constants/colours.dart';
import 'package:mydream/constants/decoration.dart';

class Reservationscreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    return 
//     CarouselSlider(
//   height: 400.0,
//   items: [1,2,3,4,5].map((i) {
//     return Builder(
//       builder: (BuildContext context) {
//         return Container(
//           width: MediaQuery.of(context).size.width,
//           margin: EdgeInsets.symmetric(horizontal: 5.0),
//           decoration: BoxDecoration(
//             color: Colors.amber
//           ),
//           child: Text('text $i', style: TextStyle(fontSize: 16.0),)
//         );
//       },
//     );
//   }).toList(),
// ) ;

    Scaffold(
      backgroundColor: k_backgroundcolor,
          body: Container(
        constraints: BoxConstraints.expand(),
        child: Padding(
          padding: const EdgeInsets.only(top: 100,bottom:100 ),
          child: ListView(
            // padding: EdgeInsets.all(0),
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: 10),
            scrollDirection: Axis.horizontal,
            children: <Widget>[
             Reservationcard(),
             Reservationcard(),
             Reservationcard(),
             Reservationcard(),
             Reservationcard(),
            ],
          ),
        ),
      ),
    );
  }
}
