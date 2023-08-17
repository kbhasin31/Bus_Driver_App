import 'package:flutter/material.dart';
import 'package:driver_app/AllScreens/LoginScreen.dart';
import 'package:driver_app/AllScreens/RegisterationScreen.dart';

class StartScreen extends StatelessWidget {
  static const String idScreen = "start";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 100.0,
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Image(image: AssetImage("images/vitimage.jpg")),
          ),
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.greenAccent[700],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(24.0)))),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, LoginScreen.idScreen, (route) => false);
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "SIGN IN",
                      style: TextStyle(
                        wordSpacing: 2.0,
                        fontSize: 24,
                        fontFamily: 'Brand-Regular',
                      ),
                    ),
                  ),
                )),
          ),
          SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
              style: TextButton.styleFrom(
                primary: Colors.greenAccent[700],
              ),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, RegisterationScreen.idScreen, (route) => false);
              },
              child: Text(
                "SIGN UP",
                style: TextStyle(fontFamily: "Brand-bold", fontSize: 17.0),
              )),
        ],
      ),
    );
  }
}
