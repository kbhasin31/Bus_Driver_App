import 'package:driver_app/AllScreens/RegisterationScreen.dart';
import 'package:driver_app/AllScreens/mainscreen.dart';
import 'package:driver_app/AllScreens/personalInfo.dart';
import 'package:driver_app/AllWidgets/configMaps.dart';
import 'package:driver_app/main.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter/material.dart';

class CarInfoScreen extends StatelessWidget {
  static const String idScreen = "carinfo";
  TextEditingController carModelTextEditingController = TextEditingController();
  TextEditingController carNumberTextEditingController =
      TextEditingController();
  TextEditingController carColorTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 22,
              ),
              Image.asset(
                "images/logo.png",
                width: 300,
                height: 300,
              ),
              Padding(
                padding: EdgeInsets.all(22),
                child: Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Enter Bus Details",
                      style: TextStyle(fontSize: 24, fontFamily: "Brand-Bold"),
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    TextField(
                      controller: carModelTextEditingController,
                      decoration: InputDecoration(
                        labelText: "Bus Model",
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 10.0),
                      ),
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: carNumberTextEditingController,
                      decoration: InputDecoration(
                        labelText: "Bus Number",
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 10.0),
                      ),
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: carColorTextEditingController,
                      decoration: InputDecoration(
                        labelText: "Bus Color",
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 10.0),
                      ),
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: ButtonTheme(
                        height: 50,
                        minWidth: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            if (carModelTextEditingController.text.isEmpty) {
                              displayToastMessage(
                                  "Bus Model is Empty", context);
                            }
                            if (carNumberTextEditingController.text.isEmpty) {
                              displayToastMessage(
                                  "Bus number is empty", context);
                            }
                            if (carColorTextEditingController.text.isEmpty) {
                              displayToastMessage(
                                  "Bus color is empty", context);
                            } else {
                              saveDriverCarInfo(context);
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, top: 5, bottom: 5),
                            child: Row(
                              children: [
                                Text(
                                  "Next",
                                  style: TextStyle(
                                      fontSize: 30.0, color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void saveDriverCarInfo(context) {
    String userId = currentfirebaseUser.uid;
    Map carInfoMap = {
      "car_color": carColorTextEditingController.text,
      "car_number": carNumberTextEditingController.text,
      "car_model": carModelTextEditingController.text,
    };

    driversRef.child(userId).child("car_details").set(carInfoMap);

    Navigator.pushNamedAndRemoveUntil(
        context, MainScreen.idScreeen, (route) => false);
  }
}
