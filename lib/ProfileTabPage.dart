import 'package:driver_app/AllScreens/StartScreen.dart';
import 'package:driver_app/AllScreens/aboutScreen.dart';
import 'package:driver_app/AllWidgets/configMaps.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter/material.dart';

class ProfileTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/bg2.jpeg"), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/user_icon.png",
                  height: 100.0,
                  width: 100.0,
                ),
                SizedBox(
                  width: 25.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Profile Name",
                      style: TextStyle(
                        fontSize: 21.0,
                        fontFamily: "Brand-Bold",
                        color: Colors.yellowAccent,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Visit Profile",
                      style: TextStyle(color: Colors.yellowAccent),
                    )
                  ],
                ),
              ],
            ),
            ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.red,
                ),
                title: Text(
                  "Profile",
                  style: TextStyle(fontSize: 20.0, color: Colors.red),
                )),
            GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, AboutScreen.idScreen, (route) => false);
              },
              child: ListTile(
                  leading: Icon(
                    Icons.info,
                    color: Colors.redAccent,
                  ),
                  title: Text(
                    "About",
                    style: TextStyle(fontSize: 20.0, color: Colors.redAccent),
                  )),
            ),
            GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, StartScreen.idScreen, (route) => false);
              },
              child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.redAccent,
                  ),
                  title: Text(
                    "Log Out",
                    style: TextStyle(fontSize: 20.0, color: Colors.redAccent),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
