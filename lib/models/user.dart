// import 'dart:html';

import 'package:mydream/config/provider.dart';
import 'package:mydream/constants/colours.dart';
import 'package:mydream/screens/Home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  String useremail;
  User({
    this.name,
    this.phonenumber,
    this.email,
    this.password,
  });

  final String name;
  final String email;
  String id;
  final String phonenumber;
  final String password;
  // final File photo ;
  CollectionReference users = Firestore.instance.collection('user');

  Future<void> addUser(BuildContext context) {
    // Call the user's CollectionReference to add a new user
    return users.add({
      'full_name': name, // John Doe
      'email': email, // Stokes and Sons
      'phone_number': phonenumber, // 42
      "photo": null
    }).then((value) async {
      print("User Added");
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("UID", value.documentID);
      // Provider.of<Userprovider>(context).setuserid(value.documentID);
    }).catchError((error) => print("Failed to add user: $error"));
  }

  FirebaseUser currentUser;

  // void loadCurrentUser() {
  //   FirebaseAuth.instance.currentUser().then((FirebaseUser user) {
  //     // call setState to rebuild the view
  //     this.currentUser = user;
  //   });
  // }

  // String getemail() {
  //   loadCurrentUser();
  //   if (currentUser != null) {
  //     return currentUser.email;
  //   } else {
  //     return "no current user";
  //   }
  // }

  Future login(BuildContext context) async {
    String user;
    try {
      final signup = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        user = email;
        // Provider.of<Userprovider>(context, listen: false).setuserid(user);
        print("sucsses");
      }, onError: (error) {
        HapticFeedback.mediumImpact();
        Future.delayed(Duration(milliseconds: 60), () {
          HapticFeedback.mediumImpact();
        });
        print(error.message);

        Scaffold.of(context).showSnackBar(SnackBar(
            backgroundColor: k_primarycolor,
            padding: EdgeInsets.all(0),
            content: Container(
              child: Text(
                error.message,
                style: TextStyle(color: Colors.white),
              ),
            )));
      });
    } catch (e) {
      // user = "failed";
      return e;
    }
    return user;
  }

  Future register(BuildContext context) async {
    String user = "sucsses";

    try {
      final signup = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        if (value != null) {
          useremail = email;
          addUser(context).then((value) {
            Scaffold.of(context).showSnackBar(SnackBar(
                backgroundColor: k_primarycolor,
                padding: EdgeInsets.all(10),
                content: Container(
                  child: Text(
                    "An account Created succesfully",
                    style: TextStyle(color: Colors.white),
                  ),
                )));
            Future.delayed(Duration(seconds: 2), () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            });
          });
        }
      }, onError: (error) {
        HapticFeedback.mediumImpact();
        Future.delayed(Duration(milliseconds: 60), () {
          HapticFeedback.mediumImpact();
        });
        print(error.message);

        Scaffold.of(context).showSnackBar(SnackBar(
            backgroundColor: k_primarycolor,
            padding: EdgeInsets.all(10),
            content: Container(
              child: Text(
                error.message,
                style: TextStyle(color: Colors.white),
              ),
            )));
      });
      return signup;
    } catch (e) {
      print(e);
      return e;
    }
  }
}
