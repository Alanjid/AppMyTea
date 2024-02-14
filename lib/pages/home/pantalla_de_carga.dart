import 'package:flutter/material.dart';
import 'package:untitled/utils/colors.dart' as utils;

class Pantalla_de_Carga extends StatelessWidget{
  const Pantalla_de_Carga({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/img/fondoNM.png',

            ),
            fit: BoxFit.cover,
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 280.0,
              width: 350.0,
            ),
            Expanded(
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(utils.Colors.azulitoArriba),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}