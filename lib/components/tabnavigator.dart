
// import 'package:flutter/material.dart';
// import 'package:mydream/screens/lawyersearch.dart';
// import 'package:mydream/screens/reservationscreen.dart';
// // import 'package:nested_navigation_demo_flutter/bottom_navigation.dart';


// class TabNavigatorRoutes {
//   static const String root = '/';
//   static const String detail = '/detail';
// }

// class TabNavigator extends StatelessWidget {
//   // TabNavigator({this.navigatorKey, this.tabItem});
//   // final GlobalKey<NavigatorState> navigatorKey;
//   // final wi tabItem;

//   void _push(BuildContext context, {int materialIndex: 500}) {
//     var routeBuilders = _routeBuilders(context, materialIndex: materialIndex);

//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) =>
//                 routeBuilders[TabNavigatorRoutes.detail](context)));
//   }

//   Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
//       {int materialIndex: 500}) {
//     return {
//       TabNavigatorRoutes.root: (context) => Lawyersearch() ,
//       TabNavigatorRoutes.detail: (context) => Reservationscreen()
//     };
//   }

//   @override
//   Widget build(BuildContext context) {
//     var routeBuilders = _routeBuilders(context);

//     return Navigator(
//         key: navigatorKey,
//         initialRoute: TabNavigatorRoutes.root,
//         onGenerateRoute: (routeSettings) {
//           return MaterialPageRoute(
//               builder: (context) => routeBuilders[routeSettings.name](context));
//         });
//   }
// }