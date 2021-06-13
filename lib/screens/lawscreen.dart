import 'package:flutter/material.dart';
import 'package:mydream/components/primarylistview.dart';
import 'package:mydream/components/subbtns.dart';
import 'package:mydream/constants/colours.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return Primarylistveiw(
      children: <Widget>[
        SizedBox(
          height: 15,
        ),
        Subbtns(
          expand: () async => await canLaunch(
                  "https://www.egypt.gov.eg/arabic/laws/download/Constitution_2014.pdf")
              ? await launch(
                  "https://www.egypt.gov.eg/arabic/laws/download/Constitution_2014.pdf")
              : throw 'Could not launch https://www.egypt.gov.eg/arabic/laws/download/Constitution_2014.pdf ',
          category: "دستور 2014",
        ),
        Subbtns(
          expand: () async => await canLaunch(
                  "https://www.egypt.gov.eg/arabic/laws/download/newlaws/UnifiedBuilding-119_2008.pdf")
              ? await launch(
                  "https://www.egypt.gov.eg/arabic/laws/download/newlaws/UnifiedBuilding-119_2008.pdf")
              : throw 'Could not launch https://www.egypt.gov.eg/arabic/laws/download/newlaws/UnifiedBuilding-119_2008.pdf ',
          category: "قانون البناء الموحد 119 لسنة 2008",
        ),
        Subbtns(
          expand: () async => await canLaunch(
                  "https://www.egypt.gov.eg/arabic/laws/download/newlaws/BylawUnifiedBuilding-144_2009.pdf")
              ? await launch(
                  "https://www.egypt.gov.eg/arabic/laws/download/newlaws/BylawUnifiedBuilding-144_2009.pdf")
              : throw 'Could not launch https://www.egypt.gov.eg/arabic/laws/download/newlaws/BylawUnifiedBuilding-144_2009.pdf ',
          category: "اللائحة التنفيذية لقانون البناء الموحد رقم 144 لسنة 2009",
        ),
        Subbtns(
          expand: () async => await canLaunch(
                  "https://www.egypt.gov.eg/arabic/laws/download/newlaws/%D8%A7%D9%84%D9%82%D8%A7%D9%86%D9%88%D9%8614%D9%84%D8%B3%D9%86%D8%A92014.pdf")
              ? await launch(
                  "https://www.egypt.gov.eg/arabic/laws/download/newlaws/%D8%A7%D9%84%D9%82%D8%A7%D9%86%D9%88%D9%8614%D9%84%D8%B3%D9%86%D8%A92014.pdf")
              : throw 'Could not launch https://www.egypt.gov.eg/arabic/laws/download/newlaws/%D8%A7%D9%84%D9%82%D8%A7%D9%86%D9%88%D9%8614%D9%84%D8%B3%D9%86%D8%A92014.pdf ',
          category:
              "قانون رقم 14 لسنة 2014 باصدار قانون بتنظيم شئون أعضاء المهن الطبية العاملين بالجهات التابعة لوزارة الصحة والسكان من غير المخاطبين بقوانين أو لوائح خاصة",
        ),
        Subbtns(
          expand: () async => await canLaunch(
                  "https://www.egypt.gov.eg/arabic/laws/download/newlaws/%D8%A7%D9%84%D9%82%D8%A7%D9%86%D9%88%D9%8679%D9%84%D8%B3%D9%86%D8%A91975.pdf")
              ? await launch(
                  "https://www.egypt.gov.eg/arabic/laws/download/newlaws/%D8%A7%D9%84%D9%82%D8%A7%D9%86%D9%88%D9%8679%D9%84%D8%B3%D9%86%D8%A91975.pdf")
              : throw 'Could not launch https://www.egypt.gov.eg/arabic/laws/download/newlaws/%D8%A7%D9%84%D9%82%D8%A7%D9%86%D9%88%D9%8679%D9%84%D8%B3%D9%86%D8%A91975.pdf ',
          category: "قانون رقم 79 لسنة 1975 باصدار قانون التأمين الاجتماعى",
        ),
        Subbtns(
          expand: () async => await canLaunch(
                  "https://www.egypt.gov.eg/arabic/laws/download/newlaws/%D9%82%D8%A7%D9%86%D9%88%D9%86%20%D8%B1%D9%82%D9%85%20%20106%D9%84%D8%B3%D9%86%D8%A92013.pdf")
              ? await launch(
                  "https://www.egypt.gov.eg/arabic/laws/download/newlaws/%D9%82%D8%A7%D9%86%D9%88%D9%86%20%D8%B1%D9%82%D9%85%20%20106%D9%84%D8%B3%D9%86%D8%A92013.pdf")
              : throw 'Could not launch https://www.egypt.gov.eg/arabic/laws/download/newlaws/%D9%82%D8%A7%D9%86%D9%88%D9%86%20%D8%B1%D9%82%D9%85%20%20106%D9%84%D8%B3%D9%86%D8%A92013.pdf ',
          category:
              "قانون رقم 106 لسنة 2013 قانون بشأن حظر تعارض مصالح المسئولين فى الدولة",
        ),
        Subbtns(
          expand: () async => await canLaunch(
                  "https://www.egypt.gov.eg/arabic/laws/download/newlaws/%D9%82%D8%A7%D9%86%D9%88%D9%86%20%D8%B1%D9%82%D9%85%2045%20%D9%84%D8%B3%D9%86%D8%A9%201982.pdf")
              ? await launch(
                  "https://www.egypt.gov.eg/arabic/laws/download/newlaws/%D9%82%D8%A7%D9%86%D9%88%D9%86%20%D8%B1%D9%82%D9%85%2045%20%D9%84%D8%B3%D9%86%D8%A9%201982.pdf")
              : throw 'Could not launch https://www.egypt.gov.eg/arabic/laws/download/newlaws/%D9%82%D8%A7%D9%86%D9%88%D9%86%20%D8%B1%D9%82%D9%85%2045%20%D9%84%D8%B3%D9%86%D8%A9%201982.pdf ',
          category:
              "قانون رقم 45 لسنة 1982 قانون تنظيم السلك الدبلوماسى والقنصلى",
        ),
        Subbtns(
          expand: () async => await canLaunch(
                  "https://www.egypt.gov.eg/arabic/laws/download/newlaws/%D9%82%D8%A7%D9%86%D9%88%D9%86%20%D8%B1%D9%82%D9%85%2053%20%D9%84%D8%B3%D9%86%D8%A9%201973%20%D8%A8%D8%B4%D8%A3%D9%86%20-%20.pdf")
              ? await launch(
                  "https://www.egypt.gov.eg/arabic/laws/download/newlaws/%D9%82%D8%A7%D9%86%D9%88%D9%86%20%D8%B1%D9%82%D9%85%2053%20%D9%84%D8%B3%D9%86%D8%A9%201973%20%D8%A8%D8%B4%D8%A3%D9%86%20-%20.pdf")
              : throw 'Could not launch https://www.egypt.gov.eg/arabic/laws/download/newlaws/%D9%82%D8%A7%D9%86%D9%88%D9%86%20%D8%B1%D9%82%D9%85%2053%20%D9%84%D8%B3%D9%86%D8%A9%201973%20%D8%A8%D8%B4%D8%A3%D9%86%20-%20.pdf ',
          category: "قانون رقم 53 لسنة 1973 قانون بشأن الموازنة العامة للدولة",
        ),
        Subbtns(
          expand: () async => await canLaunch(
                  "https://www.egypt.gov.eg/arabic/laws/download/newlaws/%D8%A7%D9%84%D9%82%D8%A7%D9%86%D9%88%D9%86%20%D8%B1%D9%82%D9%85%2032%20%D9%84%D8%B3%D9%86%D8%A9%201983.pdf")
              ? await launch(
                  "https://www.egypt.gov.eg/arabic/laws/download/newlaws/%D8%A7%D9%84%D9%82%D8%A7%D9%86%D9%88%D9%86%20%D8%B1%D9%82%D9%85%2032%20%D9%84%D8%B3%D9%86%D8%A9%201983.pdf")
              : throw 'Could not launch https://www.egypt.gov.eg/arabic/laws/download/newlaws/%D8%A7%D9%84%D9%82%D8%A7%D9%86%D9%88%D9%86%20%D8%B1%D9%82%D9%85%2032%20%D9%84%D8%B3%D9%86%D8%A9%201983.pdf ',
          category:
              "قانون رقم 32 لسنة 1983 بتعديل بعض أحكام القانون 43 لسنة 1980 بتعديل جداول مرتبات الكادرات الخاصة",
        ),
        Subbtns(
          expand: () async => await canLaunch(
                  "https://www.egypt.gov.eg/arabic/laws/download/newlaws/%D9%82%D8%A7%D9%86%D9%88%D9%86%20%D8%B1%D9%82%D9%85%2070%20%D9%84%D8%B3%D9%86%D8%A9%201973%20%D8%A8%D8%B4%D8%A3%D9%86.pdf")
              ? await launch(
                  "https://www.egypt.gov.eg/arabic/laws/download/newlaws/%D9%82%D8%A7%D9%86%D9%88%D9%86%20%D8%B1%D9%82%D9%85%2070%20%D9%84%D8%B3%D9%86%D8%A9%201973%20%D8%A8%D8%B4%D8%A3%D9%86.pdf")
              : throw 'Could not launch https://www.egypt.gov.eg/arabic/laws/download/newlaws/%D9%82%D8%A7%D9%86%D9%88%D9%86%20%D8%B1%D9%82%D9%85%2070%20%D9%84%D8%B3%D9%86%D8%A9%201973%20%D8%A8%D8%B4%D8%A3%D9%86.pdf ',
          category:
              "قانون رقم 70 لسنة 1973قانون بشأن اعداد الخطة العامة للدولة ومتابعة تنفيذها",
        ),
        Subbtns(
          expand: () async => await canLaunch(
                  "https://www.egypt.gov.eg/arabic/laws/download/newlaws/%D8%A7%D9%84%D9%82%D8%A7%D9%86%D9%88%D9%86%20127%20%D9%84%D8%B3%D9%86%D8%A9%201981.pdf")
              ? await launch(
                  "https://www.egypt.gov.eg/arabic/laws/download/newlaws/%D8%A7%D9%84%D9%82%D8%A7%D9%86%D9%88%D9%86%20127%20%D9%84%D8%B3%D9%86%D8%A9%201981.pdf")
              : throw 'Could not launch https://www.egypt.gov.eg/arabic/laws/download/newlaws/%D8%A7%D9%84%D9%82%D8%A7%D9%86%D9%88%D9%86%20127%20%D9%84%D8%B3%D9%86%D8%A9%201981.pdf ',
          category: "قانون رقم 127 لسنة 1981 بشأن المحاسبة الحكومية",
        ),
        Subbtns(
          expand: () async => await canLaunch(
                  "https://www.egypt.gov.eg/arabic/laws/download/newlaws/%D8%A7%D9%84%D9%82%D8%A7%D9%86%D9%88%D9%86%20%D8%B1%D9%82%D9%85%2049%20%D9%84%D8%B3%D9%86%D8%A9%201972.pdf")
              ? await launch(
                  "https://www.egypt.gov.eg/arabic/laws/download/newlaws/%D8%A7%D9%84%D9%82%D8%A7%D9%86%D9%88%D9%86%20%D8%B1%D9%82%D9%85%2049%20%D9%84%D8%B3%D9%86%D8%A9%201972.pdf")
              : throw 'Could not launch https://www.egypt.gov.eg/arabic/laws/download/newlaws/%D8%A7%D9%84%D9%82%D8%A7%D9%86%D9%88%D9%86%20%D8%B1%D9%82%D9%85%2049%20%D9%84%D8%B3%D9%86%D8%A9%201972.pdf ',
          category: "قانون رقم 49 لسنة 1972 بشأن تنظيم الجامعات",
        ),
      ],
    );
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
