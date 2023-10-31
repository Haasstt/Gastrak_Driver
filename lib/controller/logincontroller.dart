import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_easyloading/flutter_easyloading.dart';
// ignore: depend_on_referenced_packages
import 'package:sp_util/sp_util.dart';

class LoginController extends GetxController {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPass = TextEditingController();
  bool obscureText = true;

  void auth() {
    String emailPaten = "kurir@gmail.com";
    String nama = "Nurafiif";
    String password = "1";

    String email = txtEmail.text;
    String pass = txtPass.text;

    if (email.isEmpty || pass.isEmpty) {
      Get.snackbar(
        "Login Failed",
        "Please input field!",
        backgroundColor: const Color.fromARGB(90, 255, 17, 0),
        colorText: Colors.white,
      );
    } else {
      EasyLoading.show();
      if (email == emailPaten) {
        if (pass == password) {
          SpUtil.putString('name', nama);
          SpUtil.putString('email', email);
          SpUtil.putBool('kurir', true);
          Get.offAllNamed('/home');
        } else {
          Get.snackbar(
            "Login Failed",
            "Password incorrect!",
            backgroundColor: const Color.fromARGB(90, 255, 17, 0),
            colorText: Colors.white,
          );
        }
      } else {
        Get.snackbar(
          "Login Failed",
          "Email not found!",
          backgroundColor: const Color.fromARGB(90, 255, 17, 0),
          colorText: Colors.white,
        );
      }
      EasyLoading.dismiss();
    }
  }
}
