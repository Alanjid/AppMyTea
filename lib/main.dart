import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/pages/Actividades/Higiene/n1_rd_salud_pt2.dart';
import 'package:untitled/pages/Actividades/Prendas/act1_prendas.dart';
import 'package:untitled/pages/Widgets/tareas_completadas.dart';
import 'package:untitled/pages/home/home_page.dart';
import 'package:untitled/utils/colors.dart' as utils;

void main() {
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
      getPages: [GetPage(name: '/', page: () => MyHomePage())],
      navigatorKey: Get.key,
      //debugShowCheckedModeBanner: false,
    );
  }
}
