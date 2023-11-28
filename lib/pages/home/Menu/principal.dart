import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:soundpool/soundpool.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:untitled/pages/home/Menu/principal_controller.dart';
import 'package:untitled/pages/home/actividades_rutina_diaria.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/pages/Widgets/info_actividades.dart';
import 'package:untitled/pages/home/niveles_de_actividades.dart';
import 'package:untitled/utils/colors.dart' as utils;

class principal extends StatefulWidget {
  @override
  _principalState createState() => _principalState();
}

class _principalState extends State<principal> {
  String Texto_Menu = "Este es el menu";
  String audioUrl = 'assets/audios/menuH.mp3';
  late Soundpool _soundpool;
  late int _soundId;
  late int _streamId;
  late Timer Repite;
  double _sliderValue = 50.0;
  double _volume =
      0.5; // Agrega _volume como una propiedad y establece el valor inicial
  int _selectedSwitch = 0;
  principalController con = Get.put(principalController());

  @override
  void initState() {
    super.initState();
    _initializeSound();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 40,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                                  audioUrl = "assets/audios/menuH.mp3";
                                } else {
                                  if (index == 1) {
                                    audioUrl = "assets/audiosM/menuM.mp3";
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
              icon: Image.asset('assets/img/iconobocina.gif'),
              iconSize: 70,
            ),
            SizedBox(width: 300),
            info_pictogramas(),
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
              image: AssetImage('assets/img/fondoNM.png'),
              fit: BoxFit.cover,
            ),
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
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: 600,
                child: ListWheelScrollView(
                  itemExtent: 300,
                  diameterRatio: 2.5,
                  offAxisFraction: 0.5,
                  perspective: 0.003,
                  children: [
                    Container(
                      child: ButtonBar(
                        alignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: [
                              IconButton(
                                onPressed: () async {
                                  await _setVolume(_volume);
                                  con.goToActividades();
                                },
                                icon: Image.asset('assets/img/aprendizaje.png'),
                                iconSize: 210,
                              ),
                              StrokeText(
                                text: 'ACTIVIDADES',
                                strokeWidth: 4,
                                textStyle: TextStyle(
                                  fontFamily: 'lazydog',
                                  fontSize: 38,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: ButtonBar(
                        alignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: [
                              IconButton(
                                onPressed: () async {
                                  await _setVolume(0);
                                  con.goToRutinaDiaria();
                                },
                                icon:
                                    Image.asset('assets/img/rutinadiaria.png'),
                                iconSize: 210,
                              ),
                              StrokeText(
                                text: 'MI RUTINA DIARIA',
                                strokeWidth: 4,
                                textStyle: TextStyle(
                                  fontFamily: 'lazydog',
                                  fontSize: 38,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: ButtonBar(
                        alignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset('assets/img/avances.png'),
                                iconSize: 220,
                              ),
                              StrokeText(
                                text: 'AVANCES',
                                strokeWidth: 4,
                                textStyle: TextStyle(
                                  fontFamily: 'lazydog',
                                  fontSize: 38,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
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
  }

  void _initializeSound() async {
    _soundpool = Soundpool();
    _soundId = await rootBundle.load(audioUrl).then((ByteData soundData) {
      return _soundpool.load(soundData);
    });
    await _setVolume(_volume);
    _streamId = await _soundpool.play(_soundId);
  }
}
