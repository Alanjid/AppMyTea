import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:untitled/moldes/user.dart';
import 'package:untitled/pages/Actividades/Acciones/act_movimiento1.dart';
import 'package:untitled/pages/Actividades/Afectividad/act_afectividad.dart';
import 'package:untitled/pages/Actividades/Higiene/h1_ba%C3%B1o/aprende_poy_real.dart';
import 'package:untitled/pages/Actividades/Higiene/n1_rd_salud_pt2.dart';
import 'package:untitled/pages/Actividades/Prendas/act1_prendas.dart';
import 'package:untitled/pages/home/actividades_rutina_diaria.dart';
import 'package:untitled/pages/Login/home_page.dart';
import 'package:untitled/pages/home/niveles_de_actividades.dart';
import 'package:untitled/pages/home/Menu/principal.dart';
import 'package:untitled/pages/home/saludo/saludo_inicio.dart';

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
      initialRoute: userSession.karnet != null
          ? '/saludo'
          : '/', //VALIDACION DE SI EL USUARIO ES DIFERENTE DE NULL ENVIAR A PRINCIPAL, SI ES NULL ENVIA A LA PRINCIPAL (LOGIN)
      getPages: [
        GetPage(name: '/', page: () => MyHomePage()),
        GetPage(name: '/principal', page: () => const principal()),
        GetPage(name: '/saludo', page: () => const saludo()),
        GetPage(
            name: '/nivelesActividades',
            page: () => const niveles_actividades()),
        GetPage(
            name: '/nivelesRutinaDiaria', page: () => const rutina_diaria()),
        GetPage(name: '/act1Acciones', page: () => const movi_conejo()),
        GetPage(
            name: '/act1Afectividad', page: () => const afectividad_realista()),
        GetPage(
            name: '/act1Higiene', page: () => const apren_pony_lenguaje_real()),
        GetPage(name: '/act2Higiene', page: () => const n1_rd_salud_pt2()),
        GetPage(name: '/act1PrendasDeVestir', page: () => const act1_prendas()),
      ],
      navigatorKey: Get.key,
      debugShowCheckedModeBanner: false,
    );
  }
}
