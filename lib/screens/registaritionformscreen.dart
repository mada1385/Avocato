import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mydream/components/Roundbutton.dart';
import 'package:mydream/components/customtextfield.dart';
import 'package:mydream/components/dropdownitem.dart';
import 'package:mydream/components/texts.dart';
import 'package:mydream/config/provider.dart';
import 'package:mydream/constants/colours.dart';
import 'package:mydream/screens/Home.dart';
import 'package:provider/provider.dart';

class Registerationform extends StatefulWidget {
  final lawyer;

  Registerationform({Key key, this.lawyer}) : super(key: key);

  @override
  _RegisterationformState createState() => _RegisterationformState();
}

class _RegisterationformState extends State<Registerationform> {
  TextEditingController name = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  TextEditingController mobile = TextEditingController();

  TextEditingController brief = TextEditingController();

  String day, time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff282828),
      appBar: AppBar(
        bottomOpacity: 0.0,
        backgroundColor: k_backgroundcolor,
        title: k_title,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 100,
          ),
          Form(
            key: _formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: CustomTextfield(
                      hint: "Name",
                      controller: name,
                      validator: 0,
                      label: "Name",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: CustomTextfield(
                      hint: "phone number",
                      label: "phone number",
                      controller: mobile,
                      validator: 0,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: CustomTextfield(
                      hint: "case brief",
                      label: "case brief",
                      controller: brief,
                      validator: 0,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Dropdownmenu(
                    value: day,
                    items: [
                      "6/7/2021",
                      "7/7/2021",
                      "9/7/2021",
                      "10/7/2021",
                      "11/7/2021",
                      "12/7/2021",
                      "13/7/2021",
                      "14/7/2021",
                      "15/7/2021",
                      "16/7/2021",
                      "17/7/2021",
                    ],
                    onchange: (val) {
                      setState(() {
                        day = val;
                      });
                    },
                    hint: "setect available dates",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Dropdownmenu(
                    value: time,
                    items: [
                      "from 10 am to 11 am",
                      "from 11 am to 12 pm",
                      "from 1 pm to 2 pm ",
                      "from 2 pm to 3 pm ",
                      "from 3 pm to 4 pm ",
                      "from 4 pm to 5 pm ",
                      "from 5 pm to 6 pm ",
                      "from 6 pm to 7 pm ",
                      "from 7 pm to 8 pm ",
                      "from 8 pm to 9 pm ",
                    ],
                    onchange: (val) {
                      setState(() {
                        time = val;
                      });
                    },
                    hint: "setect available dates",
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Roundbutton(
              label: "register",
              func: () {
                // Portfolio x = Portfolio(tittle: tittle, description: description, technologies: technology, date: date,email: "email");
                if (_formKey.currentState.validate()) {
                  String documnetID =
                      DateTime.now().millisecondsSinceEpoch.toString();
                  Firestore.instance
                      .collection('registration')
                      .document(documnetID)
                      .setData({
                    "name": name.text,
                    "phone_number": mobile.text,
                    "case_brief": brief.text,
                    "date": day,
                    "time": time,
                    "lawyer": widget.lawyer.data,
                    "user":
                        Provider.of<Userprovider>(context, listen: false).user,
                    "userid": Provider.of<Userprovider>(context, listen: false)
                        .userid,
                    "lawyerid": widget.lawyer.reference.documentID
                  }).then((_) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  }).catchError((err) {
                    print(err.toString());
                    return err.toString();
                  });
                }
              })
        ],
      ),
    );
  }
}
