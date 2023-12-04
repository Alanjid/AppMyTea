import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/instance_manager.dart';
import 'package:untitled/pages/Login/login_controller.dart';
import '../home/pantalla_de_carga.dart';
import 'package:untitled/utils/colors.dart' as utils;

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  bool isLoading = true;
  bool _isPasswordVisible = true;

  loginController con = Get.put(loginController());

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    return isLoading
        ? Pantalla_de_Carga()
        : Scaffold(
            body: Center(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return SingleChildScrollView(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(
                          'assets/img/fondoNM.png',
                        ),
                        fit: BoxFit.cover,
                      )),
                      // Aquí agregas el contenido del contenedor
                      child: Column(
                        children: [
                          const SizedBox(
                            width: 350,
                            height: 250,
                            child: Image(
                                width: 100,
                                height: 100,
                                image: AssetImage("assets/img/logo.png")),
                          ),
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: ButtonBar(
                              alignment: MainAxisAlignment.center,
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SingleChildScrollView(
                                            child: Dialog(
                                              child: Center(
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 20, bottom: 20),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.white
                                                            .withOpacity(0.5),
                                                        spreadRadius: 5,
                                                        blurRadius: 7,
                                                        offset: const Offset(0,
                                                            3), // changes position of shadow
                                                      ),
                                                    ],
                                                  ),
                                                  alignment: Alignment.center,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.85,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      3,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      const SizedBox(
                                                        height: 50,
                                                        width: 50,
                                                        child: Image(
                                                          image: AssetImage(
                                                              "assets/img/logo.png"),
                                                        ),
                                                      ),
                                                      const Text(
                                                        "INICIO DE SESIÓN",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 20),
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.6,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.2,
                                                        child: TextField(
                                                          controller: con
                                                              .userController,
                                                          decoration:
                                                              const InputDecoration(
                                                                  border:
                                                                      OutlineInputBorder(),
                                                                  label: Text(
                                                                      "Ingresa el usuario"),
                                                                  icon: Icon(
                                                                    size: 20,
                                                                    Icons
                                                                        .account_circle,
                                                                    color: utils
                                                                        .Colors
                                                                        .azulitoArriba,
                                                                  ),
                                                                  hintText:
                                                                      "Ingresa el usuario"),
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.6,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.2,
                                                        child: TextField(
                                                          controller: con
                                                              .passwordController,
                                                          obscureText:
                                                              _isPasswordVisible,
                                                          decoration:
                                                              InputDecoration(
                                                            border:
                                                                const OutlineInputBorder(),
                                                            labelText:
                                                                "Ingresa la contraseña",
                                                            icon: const Icon(
                                                              Icons
                                                                  .lock_rounded,
                                                              color: utils
                                                                  .Colors
                                                                  .azulitoArriba,
                                                            ),
                                                            errorText:
                                                                "Debe contener letras, números y un símbolo",
                                                            errorStyle:
                                                                const TextStyle(
                                                              color: Colors.red,
                                                            ),
                                                            hintText:
                                                                "Ingresa la contraseña",
                                                            suffixIcon:
                                                                IconButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  _isPasswordVisible =
                                                                      !_isPasswordVisible;
                                                                });
                                                              },
                                                              icon: _isPasswordVisible
                                                                  ? const Icon(Icons
                                                                      .visibility)
                                                                  : const Icon(Icons
                                                                      .visibility_off),
                                                              color: utils
                                                                  .Colors
                                                                  .azulitoArriba,
                                                            ),
                                                          ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      MaterialButton(
                                                        color: utils.Colors
                                                            .azulitoArriba,
                                                        height: 50,
                                                        child: const Text(
                                                          "INICIAR SESIÓN",
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        onPressed: () {
                                                          AwesomeDialog(
                                                            context: context,
                                                            dialogType:
                                                                DialogType.info,
                                                            animType:
                                                                AnimType.scale,
                                                            showCloseIcon: true,
                                                            title:
                                                                "Inicio Sesion",
                                                            desc:
                                                                "¿Quiere mantener la sesion iniciada?",
                                                            btnCancelOnPress:
                                                                () {},
                                                            btnOkOnPress: () {
                                                              AwesomeDialog(
                                                                  context:
                                                                      context,
                                                                  dialogType:
                                                                      DialogType
                                                                          .success,
                                                                  animType:
                                                                      AnimType
                                                                          .scale,
                                                                  showCloseIcon:
                                                                      true,
                                                                  title: "",
                                                                  desc:
                                                                      "Inicio de sesion correcto",
                                                                  btnOkOnPress:
                                                                      () => con
                                                                          .login()).show();
                                                            },
                                                          ).show();
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  icon:
                                      Image.asset('assets/img/botonstart.png'),
                                  iconSize: 60,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
  }
}
