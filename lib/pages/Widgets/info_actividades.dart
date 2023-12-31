import 'package:untitled/utils/colors.dart' as utils;
import 'package:flutter/material.dart';

class info_pictogramas extends StatelessWidget {
  const info_pictogramas();

  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Guia de Pictogramas"),
                  content: SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.7,
                          //Contenedor de Primera columna de pictogramas
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Primer pictograma
                              Container(
                                width: 300,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black,
                                                width:
                                                    2.0), // Configura el borde negro
                                          ),
                                          child: Image(
                                            image: AssetImage(
                                                "assets/img/alimento.png"),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text("ALIMENTOS"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 300,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black,
                                                width:
                                                    2.0), // Configura el borde negro
                                          ),
                                          child: Image(
                                            image: AssetImage(
                                                "assets/img/bebidas.png"),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text("BEBIDAS"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 300,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black,
                                                width:
                                                    2.0), // Configura el borde negro
                                          ),
                                          child: Image(
                                            image: AssetImage(
                                                "assets/img/acciones.png"),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text("ACCIONES"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 300,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black,
                                                width:
                                                    2.0), // Configura el borde negro
                                          ),
                                          child: Image(
                                            image: AssetImage(
                                                "assets/img/partes del cuerpo.png"),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text("PARTES DEL CUERPO"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 300,
                                height: 245,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 9,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black,
                                                width:
                                                    2.0), // Configura el borde negro
                                          ),
                                          child: Image(
                                            image: AssetImage(
                                                "assets/img/prendas.png"),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text("PRENDAS DE VESTIR"),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black,
                                                width:
                                                    2.0), // Configura el borde negro
                                          ),
                                          child: Image(
                                            image: AssetImage(
                                                "assets/img/matemáticas.png"),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text("MATEMÁTICAS"),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 200,
                                        ),
                                        ElevatedButton(
                                          child: const Text("CERRAR"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        },
        icon: Icon(
          Icons.info,
          color: Colors.white,
          size: 30,
        ));
  }
}
