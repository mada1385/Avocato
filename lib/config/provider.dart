import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mydream/screens/Home.dart';
import 'package:mydream/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Userprovider extends ChangeNotifier {
  dynamic user;
  dynamic userid;
  int groupvalue = 0;
  changegroupvalue(int value) {
    groupvalue = value;
    notifyListeners();
  }

  logout(BuildContext context) async {
    final sp = await SharedPreferences.getInstance();
    sp.remove("user");
    user = null;
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Loginpage()));
  }

  checkforuser(BuildContext context) async {
    final sp = await SharedPreferences.getInstance();
    String shareduser = sp.get("user");
    if (shareduser == null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Loginpage()));
    } else {
      user = jsonDecode(shareduser);
      print(user);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    }
  }

  Future<void> getid(BuildContext context, String useremail) async {
    try {
      var messges = await Firestore.instance
          .collection("user")
          .where('email', isEqualTo: useremail)
          .getDocuments();
      for (var massege in messges.documents) {
        user = massege.data;

        userid = massege.reference.documentID;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("user", jsonEncode(massege.data));
        break;
      }
      print(userid);
      print(user);
    } catch (e) {}
  }

  redorate({String ref}) async {
    final res =
        await Firestore.instance.collection("lawyer").document(ref).get();
    num posts = res.data["posts"];
    num wins = res.data["wins"];
    num replies = res.data["replies"];
    num endoresment = res.data["endoresment"];
    num rate = res.data["rate"];
    num totalsum =
        rate * .4 + replies * .15 + endoresment * .2 + posts * .05 + wins * .2;
    await Firestore.instance
        .collection("lawyer")
        .document(ref)
        .updateData({"totalrate": totalsum});
  }

  addrate(String ref) async {
    final res =
        await Firestore.instance.collection("lawyer").document(ref).get();
    List i = res.data["reviews"];
    print(i);
    var result = i.map((m) => m['rate']).reduce((a, b) => a + b) / i.length;

    print(i);

    await Firestore.instance
        .collection("lawyer")
        .document(ref)
        .updateData({"rate": result});
    redorate(ref: ref);
  }

  addposts() async {
    final res =
        await Firestore.instance.collection("lawyer").document(userid).get();
    int i = res.data["posts"];
    print(i);
    i++;
    print(i);

    await Firestore.instance
        .collection("lawyer")
        .document(userid)
        .updateData({"posts": i});
    redorate();
  }

  addwins() async {
    final res =
        await Firestore.instance.collection("lawyer").document(userid).get();
    int i = res.data["wins"];
    i++;
    await Firestore.instance
        .collection("lawyer")
        .document(userid)
        .updateData({"wins": i});
    redorate();
  }

  addreplies() async {
    final res =
        await Firestore.instance.collection("lawyer").document(userid).get();
    int i = res.data["replies"];
    i++;
    await Firestore.instance
        .collection("lawyer")
        .document(userid)
        .updateData({"replies": i});
    redorate();
  }

  addendoresment(String lawyerid, bool add) async {
    final res =
        await Firestore.instance.collection("lawyer").document(lawyerid).get();
    int i = res.data["endoresment"];
    if (add) {
      i++;
    } else
      i -= 1;

    await Firestore.instance
        .collection("lawyer")
        .document(lawyerid)
        .updateData({"endoresment": i});
    redorate(ref: lawyerid);
  }
}
