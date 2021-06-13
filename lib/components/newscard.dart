import 'package:flutter/material.dart';
import 'package:mydream/components/circleavatar.dart';
import 'package:mydream/constants/colours.dart';
import 'package:mydream/constants/decoration.dart';
// import 'package:flutter_read_more_text/flutter_read_more_text.dart' as Readmore;
import 'package:mydream/components/readmore.dart';

class Newscard extends StatelessWidget {
  // const Newscard({
  final String news, name;

  const Newscard({Key key, this.news, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                  child: Text(name),
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
                  news,
                  colorClickableText: k_primarycolor,
                ),
                // "hello")
              ),
            ),
          ],
        ),
        // height: 200,
        width: double.infinity,
        decoration: kdecorationoldpapper,
        //  BoxDecoration(
        //   color: koldpapper,
        //   borderRadius: BorderRadius.all(Radius.circular(10)),
        //   border: Border.all(
        //     color: k_primarycolor,
        //   ),
        // ),
      ),
    );
  }
}
