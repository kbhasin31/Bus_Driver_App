import 'dart:async';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:driver_app/Models/allUsers.dart';
import 'package:geolocator/geolocator.dart';

String mapKey = "AIzaSyAKDd1BPt25YabUp5vLZF9OytlP3AVnXQg";

User firebaseUser;

Users userCurrentInfo;

User currentfirebaseUser;

StreamSubscription<Position> homeTabPageStreamSubscription;
