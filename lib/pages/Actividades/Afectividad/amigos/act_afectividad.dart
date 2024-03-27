import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:untitled/pages/home/felicitacion.dart';
import 'package:soundpool/soundpool.dart';
import '../../../Widgets/Objetivos.dart';
import 'package:untitled/utils/colors.dart' as utils;

class afectividad_realista extends StatefulWidget {
  @override
  afre createState() => afre();
}

class afre extends State {
  @override
  bool visible = false, visible2 = false;
  String Texto_act =
      "Estos dos pequeños son amigos, escogemos los pictogramas que pueden ser los amigos de ellos";
  String audioUrl = "assets/audios/audio_act_afectividadH.mp3";
  String objetivo = "Trabajar la afectividad de los niños";
  String instruccion = "Seleccionamos los niños que pueden ser amigos";
  String materiales = "no necesario";
  String img = "";
  late Soundpool _soundpool;
  late int _soundId;
  late int _streamId;
  late Timer Repite;
  double _sliderValue = 50.0;
  double _volume =
      0.5; // Agrega _volume como una propiedad y establece el valor inicial
  int _selectedSwitch = 0;

  void initState() {
    super.initState();
    _initializeSound();
    startTimer();
  }

  Widget build(BuildContext context) {
    if (visible == true && visible2 == true) {
      Future.delayed(Duration(seconds: 2), () async {
        await _setVolume(0);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => felicitacion(
                    photo: 'assets/img/felicitar.png',
                    width: 400,
                    heigth: 400)));
      });
    }
    /*if(visible==true && visible2==true) {
      Navigator.push(context, MaterialPageRoute(builder: (context) =>
          felicitacion(
              photo: 'assets/img/abraz.png', width: 400, heigth: 400)));
    }*/
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: utils.Colors.azulitoArriba,
          elevation: 0,
          toolbarHeight: 40,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StrokeText(
                text: "¿Les gusta hacer amigos?",
                strokeWidth: 6,
                strokeColor: Colors.orange,
                textStyle: TextStyle(
                  fontSize: 28,
                  fontFamily: 'lazydog',
                ),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            'Cambiamos la voz',
                            textAlign: TextAlign.center,
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ToggleSwitch(
                                minWidth: 100.0,
                                initialLabelIndex: _selectedSwitch,
                                cornerRadius: 20.0,
                                activeFgColor: Colors.white,
                                inactiveBgColor: Colors.grey,
                                inactiveFgColor: Colors.white,
                                totalSwitches: 2,
                                labels: ['Hombre', 'Mujer'],
                                icons: [Icons.male, Icons.female],
                                activeBgColors: [
                                  [Colors.blue],
                                  [Colors.pink]
                                ],
                                onToggle: (index) {
                                  setState(() {
                                    _selectedSwitch = index!;
                                  });
                                  print('switched to: $index');
                                  if (index == 0) {
                                    audioUrl =
                                        "assets/audios/audio_act_afectividadH.mp3";
                                  } else {
                                    if (index == 1) {
                                      audioUrl =
                                          "assets/audiosM/audio_act_afectividadM.mp3";
                                    }
                                  }
                                },
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "Cerrar",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: utils.Colors.azulitoArriba,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        );
                      });
                },
                icon: Icon(Icons.volume_up_sharp),
                iconSize: 40,
                color: Colors.white,
              ),
              SizedBox(width: 20),
              Objetivos(
                  Objetivo: "Trabajar la afectividad del niño",
                  Instrucciones:
                      "Selecciona los niños que pueden ser amigos de el",
                  Materiales: "sin material requerido",
                  imagenes: [
                    "assets/img/tijeras_real.png",
                    "assets/img/niñas.png",
                    "assets/img/platanos.png"
                  ]),
              SizedBox(
                width: 20,
              ),
              Image.asset(
                'assets/img/logo.png',
                width: 60,
                height: 60,
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    'assets/img/fondoNM.png',
                  ),
                  fit: BoxFit.cover,
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      child: Column(
                        children: [
                          Slider(
                            value: _sliderValue,
                            activeColor: Colors.redAccent,
                            inactiveColor: Colors.redAccent,
                            min: 0,
                            max: 100,
                            divisions: 100,
                            label: _sliderValue.round().toString(),
                            onChanged: (double newVolume) {
                              setState(() {
                                _setVolume(newVolume / 100);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Image(
                              image:
                                  AssetImage('assets/img/saludo_realista.png'),
                              width: 340,
                              height: 200,
                            ),
                            Container(
                              width: 348,
                              height: 80,
                              child: StrokeText(
                                text: Texto_act,
                                strokeWidth: 4.5,
                                strokeColor: Colors.black,
                                textStyle: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'lazydog',
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: 125.0,
                                      height: 125.0,
                                      padding: const EdgeInsets.all(0),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                              BorderRadius.circular(0),
                                          border: Border.all(
                                              width: 2, color: Colors.black),
                                          color: Colors.white),
                                      child: IconButton(
                                        onPressed: () {
                                          soundpool1();
                                          setState(() {
                                            visible = true;
                                          });
                                          //soundpool();
                                        },
                                        icon: Image.asset(
                                          'assets/img/niño_real.png',
                                          height: 200,
                                          width: 200.0,
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: visible,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 62, horizontal: 62),
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.orange.withOpacity(0.4)),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 86.5,
                                ),
                                //Boton Matemáticas
                                Container(
                                  width: 125.0,
                                  height: 125.0,
                                  padding: const EdgeInsets.all(0),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(0),
                                      border: Border.all(
                                          width: 2, color: Colors.black),
                                      color: Colors.white),
                                  child: IconButton(
                                    onPressed: () {
                                      soundpool2();
                                    },
                                    icon: Image.asset(
                                      'assets/img/platanos.png',
                                      height: 200,
                                      width: 200.0,
                                    ),
                                  ),
                                ),
                              ],
                            ), //primeras dos imagenes
                            SizedBox(
                              height: 30.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //Boton abrazar
                                Container(
                                  width: 125.0,
                                  height: 125.0,
                                  padding: const EdgeInsets.all(0),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(0),
                                      border: Border.all(
                                          width: 2, color: Colors.black),
                                      color: Colors.white),
                                  child: IconButton(
                                    onPressed: () {
                                      soundpool2();
                                    },
                                    icon: Image.asset(
                                      'assets/img/pelotar.png',
                                      height: 200,
                                      width: 200.0,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 90,
                                ),
                                //Boton Matemáticas
                                Stack(
                                  children: [
                                    Container(
                                      width: 125.0,
                                      height: 125.0,
                                      padding: const EdgeInsets.all(0),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                              BorderRadius.circular(0),
                                          border: Border.all(
                                              width: 2, color: Colors.black),
                                          color: Colors.white),
                                      child: IconButton(
                                        onPressed: () {
                                          soundpool1();
                                          setState(() {
                                            visible2 = true;
                                          });
                                          //soundpool();
                                        },
                                        icon: Image.asset(
                                          'assets/img/niñas.png',
                                          height: 200,
                                          width: 200.0,
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: visible2,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 62, horizontal: 62),
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.orange.withOpacity(0.4)),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
    throw UnimplementedError();
  }

  Future<void> _setVolume(double newVolume) async {
    await _soundpool.setVolume(soundId: _soundId, volume: newVolume);
    setState(() {
      _volume = newVolume;
      _sliderValue = newVolume * 100;
    });
  }

  void startTimer() {
    Repite = Timer.periodic(Duration(seconds: 10), (timer) {
      _initializeSound();
    });
  }

  @override
  void dispose() {
    Repite.cancel(); // Cancelar el temporizador antes de liberar el widget
    _soundpool.release();
    super.dispose();
  }

  void _initializeSound() async {
    _soundpool = Soundpool();
    _soundId = await rootBundle.load(audioUrl).then((ByteData soundData) {
      return _soundpool.load(soundData);
    });
    await _setVolume(_volume);
    _streamId = await _soundpool.play(_soundId);
  }

Future<void> soundpool1() async {
    Soundpool pool = Soundpool();

    int soundId = await rootBundle
        .load('assets/audios/acierto.mp3')
        .then((ByteData soundData) {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);
  }

  Future<void> soundpool2() async {
    Soundpool pool = Soundpool();

    int soundId = await rootBundle
        .load('assets/audios/error.mp3')
        .then((ByteData soundData) {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);
  }
}
