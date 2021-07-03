import 'package:flutter/material.dart';
import 'package:mydream/components/circleavatar.dart';
import 'package:mydream/components/texts.dart';
import 'package:mydream/config/provider.dart';
import 'package:mydream/constants/colours.dart';
import 'package:provider/provider.dart';

class Aboutuserscreen extends StatefulWidget {
  @override
  _AboutuserscreenState createState() => _AboutuserscreenState();
}

class _AboutuserscreenState extends State<Aboutuserscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: k_backgroundcolor,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Center(
                child: Goldcircleavatar(
              size: 120,
            )),
            SizedBox(
              height: 10,
            ),
            Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Goldtext(
                  string: Provider.of<Userprovider>(context).user["full_name"],
                ),
              ),
              color: k_backgroundcolor,
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
            Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Goldtext(
                  string: Provider.of<Userprovider>(context).user["email"],
                ),
              ),
              color: k_backgroundcolor,
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
            Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Goldtext(
                  string:
                      Provider.of<Userprovider>(context).user["phone_number"],
                ),
              ),
              color: k_backgroundcolor,
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
            GestureDetector(
              onTap: () => Provider.of<Userprovider>(context, listen: false)
                  .logout(context),
              child: Card(
                elevation: 0,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Goldtext(
                    string: "logout",
                  ),
                ),
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
