import 'package:flutter/material.dart';
import 'package:mydream/components/Roundbutton.dart';
import 'package:mydream/components/primarytextfield.dart';
import 'package:mydream/components/title.dart';
import 'package:mydream/constants/colours.dart';
class Regstration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: k_backgroundcolor,
      body:
       Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          
          Flexible(
            child: SizedBox(
              height: 50,
            ),
            
          ),
          Tiltle(),
          // Padding(
          //     padding: EdgeInsets.only(right: 90, left: 78), child: k_title),
          Primarytextfield(hint: "username",),
          SizedBox(height: 10,),
          Primarytextfield(hint: "email",),
          SizedBox(height: 10,),
          Primarytextfield(hint: "phonenumber",),
          SizedBox(height: 10,),
          Primarytextfield(hint: "password",),
          SizedBox(height: 10,),
          Primarytextfield(hint: "confirmpassword",),
          
          SizedBox(
            height: 20.0,
          ),
          SizedBox(
            height: 20.0,
          ),
          Roundbutton(
            label:  "sign up",
          ),
          SizedBox(
            height: 20,
          ),
          
        ],
      ),
    );
  }
}