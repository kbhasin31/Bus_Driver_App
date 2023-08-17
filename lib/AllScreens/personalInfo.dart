import 'package:driver_app/AllScreens/RegisterationScreen.dart';
import 'package:driver_app/AllScreens/carInfoScreen.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:driver_app/AllScreens/mainscreen.dart';
import 'package:driver_app/AllWidgets/configMaps.dart';
import 'package:driver_app/main.dart';
import 'package:flutter/material.dart';

class PersonalInfo extends StatelessWidget {
  static const String idScreen = "persinfo";
  TextEditingController fullNameTextEditingController = TextEditingController();
  TextEditingController dobTextEditingController = TextEditingController();
  TextEditingController licenseNumberTextEditingController =
      TextEditingController();

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
                      "Enter your Details",
                      style: TextStyle(fontSize: 24, fontFamily: "Brand-Bold"),
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    TextField(
                      controller: fullNameTextEditingController,
                      decoration: InputDecoration(
                        labelText: "Full Name",
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 10.0),
                      ),
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: dobTextEditingController,
                      decoration: InputDecoration(
                        labelText: "Year of birth (As mentioned in Aadhar)",
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 10.0),
                      ),
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: licenseNumberTextEditingController,
                      decoration: InputDecoration(
                        labelText: "License Number",
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
                            if (dobTextEditingController.text.isEmpty) {
                              displayToastMessage(
                                  "Dato Of Birth is Empty", context);
                            }
                            if (licenseNumberTextEditingController
                                .text.isEmpty) {
                              displayToastMessage(
                                  "License Number is empty", context);
                            }
                            if (fullNameTextEditingController.text.isEmpty) {
                              displayToastMessage(
                                  "Full name slot is empty", context);
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
    Map persInfoMap = {
      "full_name": fullNameTextEditingController.text,
      "dob": dobTextEditingController.text,
      "license": licenseNumberTextEditingController.text,
    };

    driversRef.child(userId).child("personal_details").set(persInfoMap);

    Navigator.pushNamedAndRemoveUntil(
        context, CarInfoScreen.idScreen, (route) => false);
  }
}
