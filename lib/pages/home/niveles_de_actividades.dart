import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:untitled/pages/Actividades/Afectividad/act_afectividad.dart';
import 'package:untitled/pages/Actividades/Higiene/n1_rd_salud_pt2.dart';
import 'package:untitled/pages/Actividades/Higiene/h1_ba%C3%B1o/aprende_poy_real.dart';
import 'package:untitled/pages/Widgets/tareas_completadas.dart';
import 'package:untitled/utils/colors.dart' as utils;
import '../Widgets/ActividadEstado.dart';

class niveles_actividades extends StatefulWidget {
  const niveles_actividades({super.key});

  @override
  _niveles_actividades createState() => _niveles_actividades();
}

class _niveles_actividades extends State<niveles_actividades>
    with SingleTickerProviderStateMixin {
  String texto_dictar = "Realizamos las siguientes actividades";
  String audioUrl = "assets/audios/actividadesH.mp3";
  ValueNotifier<bool> isAudioPlaying = ValueNotifier<bool>(false);
  late List<Actividad> ActividadesList;
  late int _streamId;
  Actividad alimento = Actividad(
      imagePath: 'assets/img/alimento.png',
      isEnabled: true,
      Nombre: 'Alimentos');
  Actividad bebidas = Actividad(
      imagePath: 'assets/img/bebidas.png', isEnabled: true, Nombre: 'Bebidas');
  Actividad acciones = Actividad(
      imagePath: 'assets/img/acciones.png',
      isEnabled: true,
      Nombre: 'Acciones');
  Actividad partesCuerpo = Actividad(
      imagePath: 'assets/img/partes del cuerpo.png',
      isEnabled: true,
      Nombre: 'Partes del cuerpo');
  Actividad prendas = Actividad(
      imagePath: 'assets/img/prendas.png',
      isEnabled: true,
      Nombre: 'Prendas de vestir');
  Actividad matematicas = Actividad(
      imagePath: 'assets/img/matemáticas.png',
      isEnabled: true,
      Nombre: 'Matemàticas');
  late Soundpool _soundpool;
  late int _soundId;
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
    ActividadesList = [
      alimento,
      bebidas,
      acciones,
      partesCuerpo,
      prendas,
      matematicas
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            const SizedBox(width: 8),
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
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img/fondoNM.png'), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            SizedBox(
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
              strokeColor: Colors.green,
              textStyle: const TextStyle(
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
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: ActividadesList.length,
                        itemBuilder: (context, index) {
                          Actividad actividad = ActividadesList[index];
                          return Row(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Visibility(
                                    visible: actividad.isEnabled,
                                    child: IconButton(
                                      icon: Image.asset(
                                        actividad.imagePath,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.3,
                                      ),
                                      onPressed: () {
                                        switch (actividad.imagePath) {
                                          case 'assets/img/alimento.png':
                                            _setVolume(0);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const afectividad_realista()));
                                            break;
                                          case 'assets/img/bebidas.png':
                                            _setVolume(0);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        tareas_comp_diarias()));
                                            break;
                                          case 'assets/img/acciones.png':
                                            _setVolume(0);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const apren_pony_lenguaje_real()));
                                            break;
                                          case 'assets/img/partes del cuerpo.png':
                                            _setVolume(0);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const n1_rd_salud_pt2()));
                                            break;
                                          case 'assets/img/prendas.png':
                                            _setVolume(0);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        tareas_comp_diarias()));
                                            break;
                                          case 'assets/img/matemáticas.png':
                                            _setVolume(0);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        tareas_comp_diarias()));
                                            break;
                                        }
                                      },
                                      iconSize:
                                          120, // Ajusta el tamaño del icono según tus necesidades
                                      padding: const EdgeInsets.all(
                                          8), // Ajusta el relleno según tus necesidades
                                      color: Colors
                                          .blue, // Ajusta el color del icono según tus necesidades
                                    ),
                                  )),
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
                          begin: const Offset(0, 0),
                          end: const Offset(1, 0),
                        ).animate(_animationController),
                        child: const Icon(
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
    Repite = Timer.periodic(const Duration(seconds: 10), (timer) {
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
    _streamId = await _soundpool.play(_soundId);
  }
}
