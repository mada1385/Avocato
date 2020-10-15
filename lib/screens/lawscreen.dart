import 'package:flutter/material.dart';
import 'package:mydream/components/primarylistview.dart';
import 'package:mydream/components/subbtns.dart';
import 'package:mydream/constants/colours.dart';

class Lawscreen extends StatefulWidget {
  @override
  _LawscreenState createState() => _LawscreenState();
}

class _LawscreenState extends State<Lawscreen> {
  // bool firstbuttonhight = false;
  // bool secondbuttonhight = false;
  // bool thirdbuttonhight = false;
  // bool fourthbuttonhight = false;

  @override
  Widget build(BuildContext context) {
    return Primarylistveiw(children: <Widget>[
      SizedBox(
            height: 15,
          ),
          Subbtns(
            subcategories: ["a", "b", "c", "d"],
            category: "first law",
          ),
          Subbtns(
            subcategories: ["a", "b", "c", "d"],
            category: "second law",
          ),
          Subbtns(
            subcategories: ["a", "b", "c", "d"],
            category: "third law",
          ),
          Subbtns(
            subcategories: ["a", "b", "c", "d"],
            category: "fourth law",
          ), Subbtns(
            subcategories: ["a", "b", "c", "d"],
            category: "first law",
          ),
          Subbtns(
            subcategories: ["a", "b", "c", "d"],
            category: "second law",
          ),
          Subbtns(
            subcategories: ["a", "b", "c", "d"],
            category: "third law",
          ),
          Subbtns(
            subcategories: ["a", "b", "c", "d"],
            category: "fourth law",
          ), Subbtns(
            subcategories: ["a", "b", "c", "d"],
            category: "first law",
          ),
          Subbtns(
            subcategories: ["a", "b", "c", "d"],
            category: "second law",
          ),
          Subbtns(
            subcategories: ["a", "b", "c", "d"],
            category: "third law",
          ),
          Subbtns(
            subcategories: ["a", "b", "c", "d"],
            category: "fourth law",
          ),
    ],);
  }
}
//     SafeArea(
//       child: Container(
//         color: k_backgroundcolor,
//         constraints: BoxConstraints.expand(),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Expanded(
//                           child: Container(
//                   child: ListView(
//                     children: <Widget>[
//                      Subbtns(firstbuttonhight: firstbuttonhight,subcategories: ["a","b","c","d"],expand:(){setState(() {
//                        firstbuttonhight = !firstbuttonhight;
//                      });} ,)
//                     ],
//                   ),
//                 ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

//************************************** */
// children: [
//   GestureDetector(
//       onTap: () {
//         if (firstbuttonhight == 0)
//           setState(() {
//             firstbuttonhight = 40.0;
//           });
//         else
//           setState(() {
//             firstbuttonhight = 0.0;
//           });
//       },
//       child: Container(
//         decoration: BoxDecoration(color: Color(0xff968782),
//           borderRadius: BorderRadius.all(Radius.circular(7)) ,),
//         height: 50,
//         width: double.infinity,

//         // #968782
//       )),
//   Subbtn(
//     firstbuttonhight: firstbuttonhight,
//   ),
//   Subbtn(
//     firstbuttonhight: firstbuttonhight,
//   ),
//   Subbtn(
//     firstbuttonhight: firstbuttonhight,
//   ),
//   GestureDetector(
//       onTap: () {
//         if (firstbuttonhight == 0)
//           setState(() {
//             firstbuttonhight = 40.0;
//           });
//         else
//           setState(() {
//             firstbuttonhight = 0.0;
//           });
//       },
//       child: Container(
//         decoration: BoxDecoration(color: Color(0xff968782),
//           borderRadius: BorderRadius.all(Radius.circular(7)) ,),
//         height: 50,
//         width: double.infinity,

//         // #968782
//       )),
// ],
