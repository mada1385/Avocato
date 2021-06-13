import 'package:flutter/material.dart';
import 'package:mydream/models/user.dart';

class Userprovider extends ChangeNotifier {
  String username, userphone, useremail, userid;

  void setuserid(String email) {
    username = email;

    notifyListeners();
  }
}
