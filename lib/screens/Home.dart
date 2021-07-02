// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mydream/components/circleavatar.dart';
import 'package:mydream/components/texts.dart';
import 'package:mydream/constants/colours.dart';
import 'package:mydream/screens/aboutscreen.dart';
import 'package:mydream/screens/consultaionScreen.dart';
import 'package:mydream/screens/findyouravocatoscreen.dart';
import 'package:mydream/screens/lawscreen.dart';
import 'package:mydream/screens/newsscreen.dart';
import 'package:mydream/screens/reservationscreen.dart';

enum TabItem { red, green, blue }

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 2;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List widgetOptions = <Widget>[
    Newsscreen(),
    Lawscreen(),
    Findyouravocatoscreen(),
    Consultaationscreen(),
    Aboutuserscreen()
    // BodyWidget()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(child: Container(color: k_backgroundcolor,height: double.infinity,width: double.infinity,child: Column(crossAxisAlignment: CrossAxisAlignment.center,children: <Widget>[ SizedBox(height: 20,), SafeArea(child: CircleAvatar(backgroundColor: Colors.white,minRadius: 40.0,))],),),),
      backgroundColor: Color(0xff282828),
      appBar: AppBar(
        centerTitle: true,
        bottomOpacity: 0.0,
        backgroundColor: k_backgroundcolor,
        title: Hero(tag: "logo", child: k_title),
      ),
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: k_backgroundcolor,
        selectedIconTheme: IconThemeData(color: k_primarycolor),
        selectedLabelStyle: TextStyle(color: k_primarycolor),
        unselectedItemColor: k_secondrycolor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.transparent,
            icon: Icon(
              Icons.sms_failed,
            ),
            title: Text('news'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.transparent,
            icon: Icon(Icons.book),
            title: Text('the law'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.transparent,
            icon: Icon(Icons.search),
            title: Text('find avocato'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.transparent,
            icon: Icon(Icons.message),
            title: Text('consultant'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.transparent,
            icon: Goldcircleavatar(
              size: 30,
            ),
            title: Text('consultant'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: k_primarycolor,
        onTap: _onItemTapped,
      ),
    );
  }
}
