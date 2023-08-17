import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:driver_app/AllScreens/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';

class AboutScreen extends StatelessWidget {
  static const String idScreen = "aboutScreen";
  static const colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  static const colorizeTextStyle = TextStyle(
    fontSize: 50.0,
    fontFamily: 'Horizon',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250.0,
                child: AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'About Us',
                      textStyle: colorizeTextStyle,
                      colors: colorizeColors,
                    ),
                    ColorizeAnimatedText(
                      'About Us',
                      textStyle: colorizeTextStyle,
                      colors: colorizeColors,
                    ),
                    ColorizeAnimatedText(
                      'About Us',
                      textStyle: colorizeTextStyle,
                      colors: colorizeColors,
                    ),
                  ],
                  isRepeatingAnimation: true,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            height: 100,
            child: SizedBox(
              width: 250.0,
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Brand-Bold',
                  color: Colors.black,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('We made it easy for the VITians '),
                    TypewriterAnimatedText('to track the buses inside VIT'),
                    TypewriterAnimatedText('VIT-BUS'),
                    TypewriterAnimatedText('Made by'),
                    TypewriterAnimatedText('Kartik'),
                    TypewriterAnimatedText('Bhasin'),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 200,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, MainScreen.idScreeen, (route) => false);
              },
              child: Text("Back to main Screen"))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
              context, MainScreen.idScreeen, (route) => false);
        },
        child: Icon(Icons.forward),
        backgroundColor: Colors.grey[700],
      ),
    );
  }
}
