import 'package:mydream/components/customtextfield.dart';
import 'package:mydream/constants/mediaqueryconfig.dart';
import 'package:mydream/models/user.dart';
import 'package:mydream/screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:mydream/components/Roundbutton.dart';
import 'package:mydream/components/primarytextfield.dart';
import 'package:mydream/components/title.dart';
import 'package:mydream/constants/colours.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Regstration extends StatefulWidget {
  @override
  _RegstrationState createState() => _RegstrationState();
}

class _RegstrationState extends State<Regstration> {
  final mailcontroller = TextEditingController(),
      usernamecontroller = TextEditingController(),
      phonecontroller = TextEditingController(),
      confirmpasswordcontroller = TextEditingController(),
      passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isobsecurepass = true, isobsecureCpass = true;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: k_backgroundcolor,
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: SizeConfig.blockSizeVertical * 20,
              ),
              Tiltle(),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: CustomTextfield(
                        label: "Username",
                        validator: 0,
                        controller: usernamecontroller,
                        hint: "Write your username",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: CustomTextfield(
                        label: "Email",
                        validator: 1,
                        controller: mailcontroller,
                        hint: "Write yor email",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: CustomTextfield(
                        label: "Phone number",
                        validator: 3,
                        controller: phonecontroller,
                        hint: "Write yor phone number",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: CustomTextfield(
                        isobscure: isobsecurepass,
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
                        label: "Password",
                        validator: 2,
                        controller: passwordcontroller,
                        hint: "Write yor password",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 80),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          cursorColor: k_primarycolor,
                          style: TextStyle(color: Colors.white),
                          onChanged: (val) => password = val,
                          controller: confirmpasswordcontroller,
                          obscureText: isobsecureCpass,
                          decoration: new InputDecoration(
                              suffix: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isobsecureCpass = !isobsecureCpass;
                                  });
                                },
                                child: Icon(
                                  Icons.remove_red_eye,
                                  color: k_primarycolor,
                                  size: 20,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: k_primarycolor)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: k_primarycolor),
                                //  when the TextFormField in unfocused
                              ),
                              hintText: "Confirm your password",
                              labelText: "Confirm password",
                              labelStyle: TextStyle(
                                color: textcolor,
                              ),

                              // suffix: ,
                              hintStyle: const TextStyle(color: textcolor)),
                          validator: (val) =>
                              MatchValidator(errorText: "Passwords don't match")
                                  .validateMatch(confirmpasswordcontroller.text,
                                      passwordcontroller.text),
                        )),
                    SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Regestrationsnackbutton(
                        formKey: _formKey,
                        mailcontroller: mailcontroller,
                        passwordcontroller: passwordcontroller,
                        usernamecontroller: usernamecontroller,
                        phonecontroller: phonecontroller),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Regestrationsnackbutton extends StatelessWidget {
  const Regestrationsnackbutton({
    Key key,
    @required GlobalKey<FormState> formKey,
    @required this.mailcontroller,
    @required this.passwordcontroller,
    @required this.usernamecontroller,
    @required this.phonecontroller,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController mailcontroller;
  final TextEditingController passwordcontroller;
  final TextEditingController usernamecontroller;
  final TextEditingController phonecontroller;

  @override
  Widget build(BuildContext context) {
    return Roundbutton(
      func: () async {
        if (_formKey.currentState.validate()) {
          User loginuser = User(
              email: mailcontroller.text,
              password: passwordcontroller.text,
              name: usernamecontroller.text,
              phonenumber: phonecontroller.text);
          await loginuser.register(context);
        } else {
          HapticFeedback.mediumImpact();
          Future.delayed(Duration(milliseconds: 50), () {
            // 5s over, navigate to a new page
            HapticFeedback.mediumImpact();
          });
        }
      },
      label: "Register",
    );
  }
}
