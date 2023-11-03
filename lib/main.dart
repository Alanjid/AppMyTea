import 'package:flutter/material.dart';
import 'package:untitled/pages/home/home_page.dart';
import 'package:untitled/utils/colors.dart' as utils;

void main() {
  runApp(const MyApp());
}
  class MyApp extends StatefulWidget {
    const MyApp({Key? key}) : super(key: key);
  
    @override
    State<MyApp> createState() => _MyAppState();
  }
  
  class _MyAppState extends State<MyApp> {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyTEA Pony',
        initialRoute: 'home',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            elevation: 0,
          ),
          primaryColor: utils.Colors.azulitoArriba
        ),
        routes: {
          'home' :(BuildContext context) => MyHomePage(),
        },
      );
    }
  }
  


