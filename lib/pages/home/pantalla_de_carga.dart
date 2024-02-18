import 'package:flutter/material.dart';
import 'package:untitled/utils/colors.dart' as utils;

class Pantalla_de_Carga extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/img/fondoNM.png',

            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
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