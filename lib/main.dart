import 'package:driver_app/AllScreens/aboutScreen.dart';
import 'package:driver_app/AllScreens/carInfoScreen.dart';
import 'package:driver_app/AllScreens/personalInfo.dart';
import 'package:driver_app/AllWidgets/configMaps.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:driver_app/AllScreens/LoginScreen.dart';
import 'package:driver_app/AllScreens/RegisterationScreen.dart';
import 'package:driver_app/AllScreens/StartScreen.dart';
import 'package:driver_app/AllScreens/mainscreen.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  currentfirebaseUser = FirebaseAuth.instance.currentUser;

  runApp(MyApp());
}

DatabaseReference userRef =
    FirebaseDatabase.instance.reference().child("users");
DatabaseReference driversRef =
    FirebaseDatabase.instance.reference().child("drivers");
DatabaseReference rideRequestRef = FirebaseDatabase.instance
    .reference()
    .child("drivers")
    .child(currentfirebaseUser.uid)
    .child("New Ride");

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VIT-BUS driver',
      theme: ThemeData(
        fontFamily: "Brand-Bold",
        primarySwatch: Colors.blue,
      ),
      initialRoute: FirebaseAuth.instance.currentUser == null
          ? StartScreen.idScreen
          : MainScreen.idScreeen,
      routes: {
        StartScreen.idScreen: (context) => StartScreen(),
        RegisterationScreen.idScreen: (context) => RegisterationScreen(),
        LoginScreen.idScreen: (context) => LoginScreen(),
        MainScreen.idScreeen: (context) => MainScreen(),
        CarInfoScreen.idScreen: (context) => CarInfoScreen(),
        PersonalInfo.idScreen: (context) => PersonalInfo(),
        AboutScreen.idScreen: (context) => AboutScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
