import 'package:flutter/material.dart';
import 'package:untitled/utils/colors.dart' as utils;

class Objetivos extends StatelessWidget {
  const Objetivos({
    required this.Objetivo,
    required this.Instrucciones,
    required this.Materiales,
    required this.imagenes, // Lista de rutas de imágenes
  }) : super();

  final String Objetivo;
  final String Instrucciones;
  final String Materiales;
  final List<String> imagenes; // Lista de rutas de imágenes

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
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
        height: 300,
        width: 550,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                    Text(
                    "Objetivo:",
                    style: TextStyle(
                      color: utils.Colors.azulitoArriba,
                      fontSize: 20,
                      fontFamily: 'lazydog'
                  ),
                ),
                Text(
                  Objetivo,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'lazydog'
                  ),
                ),
                Text(
                  "Instrucciones:",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'lazydog',
                    color: utils.Colors.azulitoArriba
                  ),
                ),
                Text(Instrucciones,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'lazydog'
                  ),
                ),
              ]
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  Text("Materiales: ",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'lazydog',
                      color: utils.Colors.azulitoArriba
                    ),
                  ),
                Text(Materiales,
                  style: TextStyle(
                    fontFamily: 'lazydog',
                    fontSize: 20
                  ),
                ),
                Image(
                    image: image),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
