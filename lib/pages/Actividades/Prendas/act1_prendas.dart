import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:untitled/utils/colors.dart' as utils;
import '../../Widgets/Objetivos.dart';

// ignore: camel_case_types
class act1_prendas extends StatefulWidget {
  const act1_prendas({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _act1_prendas createState() => _act1_prendas();
}

// ignore: camel_case_types
class _act1_prendas extends State {
  String Texto_act = "Preparo la ropa de mañana";
  String audioUrl = "";
  String objetivo = "";
  String instruccion = "";
  String materiales = "";
  int _streamId = 0;
  String img = "";
  late Soundpool _soundpool;
  late int _soundId;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 40,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StrokeText(
              text: Texto_act,
              strokeWidth: 6,
              strokeColor: Colors.green,
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
                        title: const Text(
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
                                  audioUrl = "";
                                } else {
                                  if (index == 1) {
                                    audioUrl = "";
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
                            child: const Text(
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
            const SizedBox(width: 20),
            Objetivos(
                Objetivo: "",
                Instrucciones: "",
                Materiales: "",
                imagenes: const ["assets/img/prendas.png"]),
            const SizedBox(
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Slider de volumen
                    SizedBox(
                      width: 300,
                      height: 50,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //AQUI IRA EL ROPERO
                        Stack(
                          children: [
                            Container(
                              width: 300.0,
                              height: 270.0,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(
                                  'assets/img/ropero.png',
                                ),
                                fit: BoxFit.fill,
                              )), // Color del contenedor
                            ),
                            Positioned(
                              top: 20,
                              left: 50,
                              child: IconButton(
                                onPressed: () {
                                  setState(() {});
                                  //soundpool();
                                },
                                icon: Image.asset(
                                  'assets/img/prendas.png',
                                ),
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 300.0,
                                  height: 270.0,
                                  color: const Color.fromARGB(255, 255, 255,
                                      255), // Color del contenedor
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                  ]),
            ),
          ),
        ],
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
    Repite = Timer.periodic(const Duration(seconds: 10), (timer) {
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
    // ignore: deprecated_member_use
    _soundpool = Soundpool();
    _soundId = await rootBundle.load(audioUrl).then((ByteData soundData) {
      return _soundpool.load(soundData);
    });
    await _setVolume(_volume);
    _streamId = await _soundpool.play(_soundId);
  }

  Future<void> soundpool2() async {
    // ignore: deprecated_member_use
    Soundpool pool = Soundpool();

    int soundId = await rootBundle
        .load('assets/audios/error.mp3')
        .then((ByteData soundData) {
      return pool.load(soundData);
    });
  }
}
