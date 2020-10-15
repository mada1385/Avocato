
import 'package:flutter/material.dart';
import 'package:mydream/components/circleavatar.dart';
import 'package:mydream/constants/colours.dart';
import 'package:mydream/constants/decoration.dart';
// import 'package:flutter_read_more_text/flutter_read_more_text.dart' as Readmore;
import 'package:mydream/components/readmore.dart';

class Newscard extends StatelessWidget {
  // const Newscard({
    
  // });

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
            child:
                Text("Lorem Ipsum is simply dummy text of the printing "),
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
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",colorClickableText: k_primarycolor,),
        // "hello")
        ),
      ),
            ],
          ),
          // height: 200,
          width: double.infinity,
          decoration: kdecorationoldpapper ,
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