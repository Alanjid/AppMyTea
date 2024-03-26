import 'package:untitled/utils/colors.dart' as utils;
import 'package:flutter/material.dart';

// ignore: camel_case_types
class info_pictogramas extends StatelessWidget {
  const info_pictogramas({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Guia de Pictogramas"),
                  content: SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.7,
                          //Contenedor de Primera columna de pictogramas
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Primer pictograma
                              SizedBox(
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
                                          child: const Image(
                                            image: AssetImage(
                                                "assets/img/alimento.png"),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        const Text("ALIMENTOS"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
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
                                          child: const Image(
                                            image: AssetImage(
                                                "assets/img/bebidas.png"),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        const Text("BEBIDAS"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
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
                                          child: const Image(
                                            image: AssetImage(
                                                "assets/img/acciones.png"),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        const Text("ACCIONES"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
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
                                          child: const Image(
                                            image: AssetImage(
                                                "assets/img/partes del cuerpo.png"),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        const Text("PARTES DEL CUERPO"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 300,
                              height: 245,
                              child: Column(
                                children: [
                                  const SizedBox(
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
                                        child: const Image(
                                          image: AssetImage(
                                              "assets/img/prendas.png"),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      const Text("PRENDAS DE VESTIR"),
                                    ],
                                  ),
                                  const SizedBox(
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
                                        child: const Image(
                                          image: AssetImage(
                                              "assets/img/matemáticas.png"),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      const Text("MATEMÁTICAS"),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              utils.Colors.azulitoArriba,
                                        ),
                                        child: const Text(
                                          "CERRAR",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ))
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
        },
        icon: const Icon(
          Icons.info,
          color: Colors.white,
          size: 30,
        ));
  }
}
