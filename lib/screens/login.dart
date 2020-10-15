import 'package:flutter/material.dart';
import 'package:mydream/components/Roundbutton.dart';
import 'package:mydream/components/primarytextfield.dart';
import 'package:mydream/components/texts.dart';
import 'package:mydream/components/title.dart';
import 'package:mydream/constants/colours.dart';
import 'package:mydream/screens/Home.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:mydream/main.dart';
// import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:mydream/screens/regestraiton.dart';

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: k_backgroundcolor,
      body: Column(
        children: <Widget>[
          Flexible(
            child: SizedBox(
              height: 250,
            ),
          ),
          Tiltle(),
          Primarytextfield(
            hint: "email",
          ),
          Primarytextfield(
            hint: "password",
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 75),
                  child: GestureDetector(
                      child: Text(
                    "forgot password ?",
                    style: TextStyle(color: k_primarycolor),
                  )))
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Roundbutton(
            func: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Home()));
            },
            label: "login",
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(children: <Widget>[
                Text(
                  "__________ or sign in with__________",
                  style: TextStyle(color: k_primarycolor),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    // SizedBox(width: 100,),
                    GestureDetector(
                      child: Image.asset("asset/59439.png", height: 30),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      child: Image.asset("asset/pngguru.png", height: 30),
                    ),
                  ],
                ),
                //  Signin(label: "facebook",logo: Image.asset("asset/5943.png",height: 30 ,), ),
                //  SizedBox(height: 7.5,),
                //  Signin(label: "Google",logo: Image.asset("asset/google.png",height: 30 ,),),
                // SignInButton(
                //   Buttons.Facebook,
                //   text: "facebook",
                //   onPressed: () {},
                // ),
                // SignInButton(
                //   Buttons.Google,
                //   text: "Google",
                //   onPressed: () {},
                // ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "dont have account?",
                      style: TextStyle(color: k_primarycolor),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Regstration()));
                      },
                      child: Text(
                        "sign up now",
                        style: TextStyle(
                            color: k_primarycolor,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                )
              ])
            ],
          ),
        ],
      ),
    );
  }
}



class Signin extends StatelessWidget {
  final Image logo;
  final String label;
  final Function func;
  Signin({this.label, this.logo, this.func});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        color: Colors.white,
        constraints: BoxConstraints(
          maxWidth: 220,
          maxHeight: 36.0,
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 13,
                ),
                child: logo,
              ),
              Text(
                label,
                // "facebook",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: k_primarycolor,
                  fontSize: 12,
                  backgroundColor: Color.fromRGBO(0, 0, 0, 0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
