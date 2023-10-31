import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:page_transition/page_transition.dart';

class RegistrasiController extends GetxController {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPass = TextEditingController();
  TextEditingController txtUsername = TextEditingController();
  bool obscureText = true;
  String email = "";
  String pass = "";
  String name = "";

  void registrasi() {
    print(email);
    print(pass);
    print(name);
  }
}
