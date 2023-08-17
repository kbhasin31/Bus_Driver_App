import 'package:driver_app/AllScreens/carInfoScreen.dart';
import 'package:driver_app/AllScreens/personalInfo.dart';
import 'package:driver_app/AllWidgets/configMaps.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:driver_app/AllScreens/LoginScreen.dart';
import 'package:driver_app/AllScreens/mainscreen.dart';
import 'package:driver_app/AllWidgets/progressDialog.dart';
import 'package:driver_app/main.dart';

class RegisterationScreen extends StatelessWidget {
  static const String idScreen = "register";

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 25.0,
              ),
              Image(
                image: AssetImage("images/logo.png"),
                width: 400.0,
                height: 200.0,
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Register as Driver",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Brand-Bold",
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                        controller: nameTextEditingController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            labelText: "Name",
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 10.0,
                            )),
                        style: TextStyle(fontSize: 14.0)),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                        controller: emailTextEditingController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 10.0,
                            )),
                        style: TextStyle(fontSize: 14.0)),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                        controller: phoneTextEditingController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            labelText: "Phone Number",
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 10.0,
                            )),
                        style: TextStyle(fontSize: 14.0)),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                        controller: passwordTextEditingController,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 10.0,
                            )),
                        style: TextStyle(fontSize: 14.0)),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                        child: Container(
                          height: 40.0,
                          child: Center(
                            child: Text(
                              "Register Here",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: "Brand Bold",
                              ),
                            ),
                          ),
                        ),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                                side: BorderSide(color: Colors.black)),
                          ),
                        ),
                        onPressed: () {
                          if (nameTextEditingController.text.length < 5) {
                            displayToastMessage(
                                "Name should be atleast 4 characters.",
                                context);
                          } else if (!emailTextEditingController.text
                              .contains("@")) {
                            displayToastMessage(
                                "Email address entered is not valid.", context);
                          } else if (phoneTextEditingController.text.isEmpty) {
                            displayToastMessage(
                                "Phone number is mandatory", context);
                          } else if (phoneTextEditingController.text.length <
                              10) {
                            displayToastMessage(
                                "Please enter a valid phone number", context);
                          } else if (passwordTextEditingController.text.length <
                              8) {
                            displayToastMessage(
                                "Password length should be more 8 characters",
                                context);
                          } else {
                            registerNewUser(context);
                          }
                        }),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, LoginScreen.idScreen, (route) => false);

                  print("clicked");
                },
                child: Text("Already have an account?Sign in Here"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void registerNewUser(BuildContext context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return ProgressDialog(
            message: "Registering, Please wait...",
          );
        });

    final User firebaseUser = (await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError((errMsg) {
      displayToastMessage("Error: " + errMsg.toString(), context);
    }))
        .user;

    if (firebaseUser != null) //user .created
    {
      userRef.child(firebaseUser.uid);

      Map userDataMap = {
        "name": nameTextEditingController.text,
        "email": emailTextEditingController.text,
        "phone": phoneTextEditingController.text,
        "password": passwordTextEditingController.text,
      };
      driversRef.child(firebaseUser.uid).set(userDataMap);

      currentfirebaseUser = firebaseUser;

      displayToastMessage("congrats, your account has been created", context);

      Navigator.pushNamedAndRemoveUntil(
          context, PersonalInfo.idScreen, (route) => false);
    } else {
      Navigator.pop(context);

      displayToastMessage("New User Account has not been created.", context);
    }
  }
}

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}
