import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
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

  final passwordController = TextEditingController();

  @override
  void initState() {
    Image.asset('assets/img/fondoNM.png');

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
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
                                    Get.toNamed('/Login');
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
