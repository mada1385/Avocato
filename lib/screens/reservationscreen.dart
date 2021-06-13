import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mydream/components/reservationcard.dart';
import 'package:mydream/config/provider.dart';
import 'package:provider/provider.dart';

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

        Container(
      constraints: BoxConstraints.expand(),
      child: Padding(
        padding: const EdgeInsets.only(top: 50, bottom: 50),
        child: StreamBuilder(
            stream: Firestore.instance
                .collection("registration")
                .where("usermail",
                    isEqualTo: Provider.of<Userprovider>(context).username)
                .snapshots(),
            builder: (context, snapshot) {
              return ListView(
                  // padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(left: 10),
                  scrollDirection: Axis.horizontal,
                  children: snapshot.data.documents
                      .map<Widget>((e) => Builder(
                          builder: (context) => Reservationcard(
                                lawyername: e["lawyername"],
                                date: e["date"],
                                time: e["time"],
                              )))
                      .toList()
                  // <Widget>[
                  //   Reservationcard(),
                  //   Reservationcard(),
                  //   Reservationcard(),
                  //   Reservationcard(),
                  //   Reservationcard(),
                  // ],
                  );
            }),
      ),
    );
  }
}
