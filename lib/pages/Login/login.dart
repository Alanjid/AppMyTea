import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/pages/Login/login_controller.dart';
import 'package:untitled/utils/colors.dart' as utils;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  loginController con = Get.put(loginController());
  bool _isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: utils.Colors.azulitoArriba,
      body: SingleChildScrollView(
        child: Dialog(
          child: Center(
            child: Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.85,
              width: MediaQuery.of(context).size.width * 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                    width: 50,
                    child: Image(
                      image: AssetImage("assets/img/logo.png"),
                    ),
                  ),
                  const Text(
                    "INICIO DE SESIÓN",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: TextField(
                      controller: con.userController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Ingresa el usuario"),
                          icon: Icon(
                            size: 20,
                            Icons.account_circle,
                            color: utils.Colors.azulitoArriba,
                          ),
                          hintText: "Ingresa el usuario"),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: TextField(
                      controller: con.passwordController,
                      obscureText: _isPasswordVisible,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: "Ingresa la contraseña",
                        icon: const Icon(
                          Icons.lock_rounded,
                          color: utils.Colors.azulitoArriba,
                        ),
                        hintText: "Ingresa la contraseña",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                          icon: _isPasswordVisible
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                          color: utils.Colors.azulitoArriba,
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    color: utils.Colors.azulitoArriba,
                    height: 50,
                    child: const Text(
                      "INICIAR SESIÓN",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onPressed: () {
                      con.login();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
