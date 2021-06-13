import 'package:mydream/components/customtextfield.dart';
import 'package:mydream/constants/mediaqueryconfig.dart';
import 'package:mydream/models/user.dart';
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
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final mailcontroller = TextEditingController(),
      passwordcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isobsecurepass = true;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: k_backgroundcolor,
      body: Theme(
        data: ThemeData(accentColor: k_primarycolor),
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                SizedBox(height: SizeConfig.blockSizeVertical * 25),
                Center(child: Tiltle()),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 80, vertical: 20),
                          child: CustomTextfield(
                              controller: mailcontroller,
                              hint: "write your email",
                              isobscure: false,
                              label: "Email",
                              priffix: Icons.mail_outline,
                              validator: 1),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80),
                          child: CustomTextfield(
                            suffix: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isobsecurepass = !isobsecurepass;
                                });
                              },
                              child: Icon(
                                Icons.remove_red_eye,
                                color: k_primarycolor,
                                size: 20,
                              ),
                            ),
                            controller: passwordcontroller,
                            hint: "Write your password",
                            isobscure: isobsecurepass,
                            label: "Password",
                            priffix: Icons.lock_outline,
                            validator: 2,
                          ),
                        ),
                      ],
                    )),
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
                Loginsnackbutton(
                    formKey: _formKey,
                    mailcontroller: mailcontroller,
                    passwordcontroller: passwordcontroller),
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
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          // SizedBox(width: 100,),
                          GestureDetector(
                              child: Icon(
                            FontAwesomeIcons.google,
                            color: k_primarycolor,
                          )),

                          SizedBox(
                            width: 30,
                          ),
                          GestureDetector(
                            child: Icon(
                              FontAwesomeIcons.facebookF,
                              color: k_primarycolor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
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
          ],
        ),
      ),
    );
  }
}

class Loginsnackbutton extends StatelessWidget {
  const Loginsnackbutton({
    Key key,
    @required GlobalKey<FormState> formKey,
    @required this.mailcontroller,
    @required this.passwordcontroller,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController mailcontroller;
  final TextEditingController passwordcontroller;

  @override
  Widget build(BuildContext context) {
    return Roundbutton(
      func: () async {
        if (_formKey.currentState.validate()) {
          User loginuser = User(
              email: mailcontroller.text, password: passwordcontroller.text);
          final loggeduser = await loginuser.login(context);
          if (loggeduser != null) {
            // if (loggeduser == "success") {
            print(loggeduser);
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            preferences.setString("email", loggeduser);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home()));
            // Provider.of<Userprovider>(context, listen: false)
            //     .setemail(email.text);
            // }
            // else {
            //   Scaffold.of(context).showSnackBar(SnackBar(
            //     content: Text(loggeduser.toString()),
            //   ));
            // }
          }
        } else {
          HapticFeedback.mediumImpact();
          Future.delayed(Duration(milliseconds: 50), () {
            // 5s over, navigate to a new page
            HapticFeedback.mediumImpact();
          });
        }
      },
      label: "Login",
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
