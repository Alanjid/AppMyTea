import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class loginController extends GetxController {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void goToHelloPage() {
    Get.toNamed('/saludo');
  }

  void login() {
    String user = userController.text.trim();
    String password = passwordController.text.trim();

    print('Email ${user}');
    print('Password ${password}');

    if (isValidForm(user, password)) {
      goToHelloPage();
    }
  }

  bool isValidForm(String user, String password) {
    if (user.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar un usuario');
      return false;
    }
    if (password.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar una contraseña');
      return false;
    }
    return true;
  }
}
