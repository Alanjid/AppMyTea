import 'package:flutter/material.dart';
import 'package:untitled/utils/colors.dart' as utils;

class Objetivos extends StatelessWidget {
  final GlobalKey<State> _key = GlobalKey<State>();
   Objetivos({super.key, 
    required this.Objetivo,
    required this.Instrucciones,
    required this.Materiales,
    required this.imagenes, // Lista de rutas de imágenes
  });

  final String Objetivo;
  final String Instrucciones;
  final String Materiales;
  final List<String> imagenes; // Lista de rutas de imágenes


  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        showDialog(
            context: context,
            builder: (BuildContext context){
              return AlertDialog(
                    content: Container(
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Objetivo:",
                                  style: TextStyle(
                                      color: utils.Colors.azulitoArriba,
                                      fontSize: 20,
                                      fontFamily: 'lazydog'
                                  ),
                                ),
                                SizedBox(
                                    width: 150,
                                    child: Expanded(
                                      child: Text(
                                        Objetivo,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'lazydog',
                                            color: Colors.black
                                        ),
                                      ),
                                    )
                                ),
                                const SizedBox(height: 30,),
                                const Text(
                                  "Instrucciones:",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'lazydog',
                                      color: utils.Colors.azulitoArriba
                                  ),
                                ),
                                SizedBox(
                                    width: 150,
                                    child: Expanded(
                                      child: Text(
                                        Instrucciones,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'lazydog',
                                            color: Colors.black
                                        ),
                                      ),
                                    )
                                ),
                              ]
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Materiales:",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'lazydog',
                                    color: utils.Colors.azulitoArriba
                                ),
                              ),
                              SizedBox(
                                  width: 150,
                                  child: Expanded(
                                    child: Text(
                                      Materiales,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'lazydog',
                                          color: Colors.black
                                      ),
                                    ),
                                  )
                              ),
                              SizedBox(
                                height: 150,
                                width: 120,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: imagenes.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.network(
                                        imagenes[index],
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.contain, // Puedes ajustar esto según tus necesidades
                                      ),
                                    );
                                  },
                                ),
                              ),
                              ElevatedButton(
                                child: const Text("CERRAR"),
                                onPressed: (){
                                  Navigator.pop(context);
                                },

                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
              );
            }
        );
      },
      icon: const Icon(
      Icons.info,
      color: Colors.white,
      size: 30,
    ),

    );
  }
}
