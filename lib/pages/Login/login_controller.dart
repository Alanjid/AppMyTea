import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:untitled/models/response_api.dart';
import 'package:untitled/providers/users_provider.dart';

import '../../models/user.dart';

// ignore: camel_case_types
class loginController extends GetxController {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  void goToHelloPage() {
    Get.toNamed('/saludo');
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

  void login() async {
    try {
      String username = userController.text.trim();
      String password = passwordController.text.trim();
      print('Username: $username');
      print('Password: $password');
      User user = User.fromJson(GetStorage().read('user') ?? {});

      ResponseApi responseApi = await usersProvider.login(username, password);
      print('Response Api: ${responseApi.toJson()}');

      if (responseApi.success == true) {
        GetStorage().write('user', responseApi.data);
        Get.snackbar(
            'Inicio de sesion correcto', "Bienvenido ${user.nombre.toString()}",
            snackPosition: SnackPosition.TOP,
            icon: Icon(
              Icons.done_outline,
              color: Colors.greenAccent,
              size: 50,
            ));
        goToHelloPage();
      } else {
        Get.snackbar('Error', responseApi.message ?? 'Inicio de sesión fallido',
            snackPosition: SnackPosition.TOP,
            icon: Icon(
              Icons.not_interested_sharp,
              color: Colors.red,
              size: 50,
            ));
      }
    } catch (e) {
      print('Error en la solicitud: $e');
      Get.snackbar('Error', 'Hubo un problema al realizar la solicitud',
          snackPosition: SnackPosition.TOP,
          icon: Icon(
            Icons.signal_wifi_connected_no_internet_4_outlined,
            color: Colors.red,
          ));
    }
  }
}
