import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mydream/components/reservationcard.dart';
import 'package:mydream/config/provider.dart';
import 'package:mydream/constants/colours.dart';
import 'package:provider/provider.dart';

class Reservationscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      child: Padding(
        padding: const EdgeInsets.only(top: 50, bottom: 50),
        child: StreamBuilder(
            stream: Firestore.instance
                .collection("registration")
                .where("userid",
                    isEqualTo: Provider.of<Userprovider>(context).userid)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.data == null)
                return Center(
                    child: Theme(
                        data: ThemeData(accentColor: k_primarycolor),
                        child: CircularProgressIndicator()));
              else
                return ListView(
                    // padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(left: 10),
                    scrollDirection: Axis.horizontal,
                    children: snapshot.data.documents
                        .map<Widget>((e) => Builder(
                            builder: (context) => Reservationcard(
                                  lawyername: e["lawyer"]["full_name"],
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
