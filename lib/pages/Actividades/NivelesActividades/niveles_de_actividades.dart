import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'package:untitled/pages/Widgets/fabrica_actividades.dart';

import 'package:untitled/utils/colors.dart' as utils;

// ignore: camel_case_types
class niveles_actividades extends StatefulWidget {
  const niveles_actividades({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _niveles_actividades createState() => _niveles_actividades();
}

// ignore: camel_case_types
class _niveles_actividades extends State<niveles_actividades>
    with SingleTickerProviderStateMixin {
  // ignore: non_constant_identifier_names
  String texto_dictar = "Realizamos las siguientes actividades";
  String audioUrl = "assets/audios/actividadesH.mp3";
  late int _streamId;
  ValueNotifier<bool> isAudioPlaying = ValueNotifier<bool>(false);

  late ActividadFactory _actividadFactory;
  late List<Actividad> actividades;
  late Soundpool _soundpool;
  late int _soundId;
  // ignore: non_constant_identifier_names
  late Timer Repite;
  double _sliderValue = 50.0;
  double _volume = 0.5;
  int _selectedSwitch = 0;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _initializeSound();
    startTimer();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animationController.repeat(reverse: true);
    _actividadFactory = ActividadFactory();
    actividades = [
      _actividadFactory.crearActividad('Afectividad'),
      _actividadFactory.crearActividad('Matematicas'),
      _actividadFactory.crearActividad('Lenguaje'),
      _actividadFactory.crearActividad('HigieneySalud'),
      _actividadFactory.crearActividad('Movimiento'),
      _actividadFactory.crearActividad('Creatividad'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: utils.Colors.azulitoArriba,
        elevation: 0,
        toolbarHeight: 50,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      //Alert dialog
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
                              labels: const ['Hombre', 'Mujer'],
                              icons: const [Icons.male, Icons.female],
                              activeBgColors: const [
                                [Colors.blue],
                                [Colors.pink]
                              ],
                              onToggle: (index) {
                                setState(() {
                                  _selectedSwitch = index!;
                                });
                                print('switched to: $index');
                                if (index == 0) {
                                  audioUrl = "assets/audios/actividadesH.mp3";
                                } else {
                                  if (index == 1) {
                                    audioUrl =
                                        "assets/audiosM/actividadesM.mp3";
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
            SizedBox(width: 8),
            Image.asset(
              'assets/img/logo.png',
              width: 60,
              height: 60,
            ),
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img/fondoNM.png'), fit: BoxFit.cover),
        ),
        child: Column(
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
            StrokeText(
              text: texto_dictar,
              strokeWidth: 6,
              strokeColor: Color.fromARGB(255, 7, 36, 165),
              textStyle: TextStyle(
                fontSize: 38,
                fontFamily: 'lazydog',
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 150,
                      width: MediaQuery.sizeOf(context).width,
                      child: ListView.builder( //AQUI SE REALIZA LA ASIGNACION DE BOTONES DE MANERA
                        scrollDirection: Axis.horizontal,
                        itemCount: actividades.length,
                        itemBuilder: (context, index) {
                          Actividad actividad = actividades[index];
                          return Row(
                            children: [
                              _actividadFactory.crearBotonActividad(
                                context, actividad, _setVolume)
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (int i = 0; i < 4; i++)
                      SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset(0, 0),
                          end: Offset(1, 0),
                        ).animate(_animationController),
                        child: Icon(
                          Icons.arrow_forward,
                          size: 30,
                          color: Colors.white,
                        ),
                      )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
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
    _animationController.dispose();
  }

  void _initializeSound() async {
    _soundpool = Soundpool();
    _soundId = await rootBundle.load(audioUrl).then((ByteData soundData) {
      return _soundpool.load(soundData);
    });
    await _setVolume(_volume);
  }
}
