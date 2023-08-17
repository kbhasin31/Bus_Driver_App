import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';

class Users {
  String id;
  String email;
  String phone;
  String name;
  Users({this.id, this.email, this.phone, this.name});
  Users.fromSnapshot(DataSnapshot dataSnapshot) {
    id = dataSnapshot.key;
    email = dataSnapshot.value["email"];
    name = dataSnapshot.value["name"];
    phone = dataSnapshot.value["phone"];
  }
}
