import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:untitled/models/user.dart';
import 'package:untitled/pages/Actividades/Afectividad/saludos/decir_hola.dart';
import 'package:untitled/pages/Actividades/Movimiento/act_movimiento1.dart';
import 'package:untitled/pages/Actividades/Afectividad/amigos/act_afectividad.dart';
import 'package:untitled/pages/Actividades/Lenguaje/aprende_objetosl.dart';
import 'package:untitled/pages/Actividades/Higiene/n1_rd_salud_pt2.dart';
import 'package:untitled/pages/Actividades/Lenguaje/act1_prendas.dart';

import 'package:untitled/pages/Login/home_page.dart';
import 'package:untitled/pages/Login/login.dart';
import 'package:untitled/pages/Widgets/observaciones/observaciones.dart';
import 'package:untitled/pages/Widgets/observaciones/resumen_actividad.dart';
import 'package:untitled/pages/Widgets/tareas_completadas.dart';
import 'package:untitled/pages/home/niveles_de_actividades.dart';
import 'package:untitled/pages/home/Menu/principal.dart';
import 'package:untitled/pages/home/saludo/saludo_inicio.dart';
import 'package:untitled/utils/colors.dart' as utils;

User userSession = User.fromJson(GetStorage().read('user') ?? {});
void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MyTEAPony',
      //initialRoute: userSession.karnet != null ? '/observaciones': '/', //VALIDACION DE SI EL USUARIO ES DIFERENTE DE NULL ENVIAR A PRINCIPAL, SI ES NULL ENVIA A LA PRINCIPAL (LOGIN)
      initialRoute: '/resumen_actividad',
      getPages: [
        GetPage(name: '/', page: () => MyHomePage()),
        GetPage(name: '/principal', page: () => principal()),
        GetPage(name: '/saludo', page: () => saludo()),
        GetPage(
            name: '/nivelesActividades',
            page: () => const niveles_actividades()),
        GetPage(name: '/act1Acciones', page: () => movi_conejo()),
        GetPage(name: '/act1Afectividad', page: () => afectividad_realista()),
        GetPage(name: '/act1Afectividad', page: () => apren_objetos()),
        GetPage(name: '/act2Higiene', page: () => n1_rd_salud_pt2()),
        GetPage(name: '/act1PrendasDeVestir', page: () => const act1_prendas()),
        GetPage(name: '/actLavarManos', page: () => n1_rd_salud_pt2()),
        GetPage(name: '/Completadas', page: () => tareas_comp_diarias()),
        GetPage(name: '/Login', page: () => const Login()),
        GetPage(name: '/resumen_actividad', page: () => const resumen_actividad()),
        GetPage(name: '/observaciones', page: ()=> observaciones()),
        GetPage(name: '/afe_decir_hola', page: () => decir_hola()),
      ],
      navigatorKey: Get.key,
      debugShowCheckedModeBanner: false,
    );
  }
}
