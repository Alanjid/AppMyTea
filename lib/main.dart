import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:untitled/pages/Actividades/Acciones/act_movimiento1.dart';
import 'package:untitled/pages/Actividades/Afectividad/act_afectividad.dart';
import 'package:untitled/pages/Actividades/Higiene/aprende_poy_real.dart';
import 'package:untitled/pages/Actividades/Higiene/n1_rd_salud_pt2.dart';
import 'package:untitled/pages/Actividades/Prendas/act1_prendas.dart';
import 'package:untitled/pages/home/actividades_rutina_diaria.dart';
import 'package:untitled/pages/Login/home_page.dart';
import 'package:untitled/pages/home/niveles_de_actividades.dart';
import 'package:untitled/pages/home/Menu/principal.dart';
import 'package:untitled/pages/home/saludo/saludo_inicio.dart';
import 'package:untitled/utils/colors.dart' as utils;

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
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => MyHomePage()),
        GetPage(name: '/principal', page: () => principal()),
        GetPage(name: '/saludo', page: () => saludo()),
        GetPage(name: '/nivelesActividades', page: () => niveles_actividades()),
        GetPage(name: '/nivelesRutinaDiaria', page: () => rutina_diaria()),
        GetPage(name: '/act1Acciones', page: () => movi_conejo()),
        GetPage(name: '/act1Afectividad', page: () => afectividad_realista()),
        GetPage(name: '/act1Higiene', page: () => apren_pony_lenguaje_real()),
        GetPage(name: '/act2Higiene', page: () => n1_rd_salud_pt2()),
        GetPage(name: '/act1PrendasDeVestir', page: () => const act1_prendas()),
      ],
      navigatorKey: Get.key,
      debugShowCheckedModeBanner: false,
    );
  }
}
