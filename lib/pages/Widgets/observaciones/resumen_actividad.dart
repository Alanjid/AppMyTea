import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:soundpool/soundpool.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:untitled/pages/Widgets/observaciones/resumen_actividad_controller.dart';
import 'package:untitled/pages/home/Menu/principal_controller.dart';
import 'package:untitled/utils/colors.dart' as utils;
// ignore: camel_case_types
class resumen_actividad extends StatefulWidget {
  const resumen_actividad({super.key});

  @override
  State<resumen_actividad> createState() => _resumen_actividadState();
}

// ignore: camel_case_types
class _resumen_actividadState extends State<resumen_actividad> {
  // ignore: non_constant_identifier_names
  String Texto_Menu = "Enviar observaciones";
  String audioUrl = 'assets/audios/';
  late Soundpool _soundpool;
  late int _soundId;
  late int _streamId;
  // ignore: non_constant_identifier_names
  late Timer Repite;
  double _sliderValue = 50.0;
  double _volume =
      0.5; // Agrega _volume como una propiedad y establece el valor inicial
  int _selectedSwitch = 0;

  resumen_controller con = Get.put(resumen_controller());

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
        backgroundColor: utils.Colors.azulitoArriba,
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
              icon: const Icon(Icons.volume_up_sharp),
              iconSize: 40,
              color: Colors.white,
            ),
            const SizedBox(width: 300),
            Image.asset(
              'assets/img/logo.png',
              width: 60,
              height: 60,
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/fondoNM.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          children: [
            
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                const StrokeText(
                  text: 'RESUMEN DE ACTIVIDAD:',
                  strokeWidth: 3,
                  textColor: Colors.white,
                  strokeColor: Colors.black,
                  textStyle: TextStyle(fontSize: 25),
                ),
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      width: MediaQuery.sizeOf(context).width * 0.20,
                      height: MediaQuery.sizeOf(context).height * 0.30,
                      child: Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              con.goToMenu();
                            },
                            icon: Image.asset('assets/img/logo_casa.png',
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                            )
                          ),
                          const Text(
                            'MENU',
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: MediaQuery.sizeOf(context).width * 0.05),
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      width: MediaQuery.sizeOf(context).width * 0.20,
                      height: MediaQuery.sizeOf(context).height * 0.30,
                      child: Column(
                        children: [
                          IconButton(
                            onPressed: (){
                              con.goToObservaciones();
                          }, icon: 
                            Image.asset(
                              'assets/img/observacion_icon.png',
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                            ),
                            ),
                          const Text(
                            'OBSERVACIONES',
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(width: MediaQuery.sizeOf(context).width *0.1,),
            Container(
                      child: Column(
                        children: [
                          SizedBox(height: MediaQuery.sizeOf(context).height*0.05,),
                          Container(
                            decoration:const  BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            width: MediaQuery.sizeOf(context).width * 0.3,
                            height: MediaQuery.sizeOf(context).height *0.12,
                            child: Row(
                              children: [
                                SizedBox(width: MediaQuery.sizeOf(context).width*0.04,),
                                Image.asset('assets/img/Time.png',
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover,
                                ),
                                SizedBox(width: MediaQuery.sizeOf(context).width*0.02,),
                                const Text('Tiempo',
                                style: TextStyle(
                                  fontSize: 20
                                ),),
                              ],
                            ),
                          ),
                          SizedBox(height: MediaQuery.sizeOf(context).height*0.05,),
                          Container(
                            decoration:const  BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            width: MediaQuery.sizeOf(context).width * 0.3,
                            height: MediaQuery.sizeOf(context).height *0.12,
                             child: Row(
                              children: [
                                SizedBox(width: MediaQuery.sizeOf(context).width*0.04,),
                                Image.asset('assets/img/intentos_icon.png',
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover,
                                ),
                                SizedBox(width: MediaQuery.sizeOf(context).width*0.02,),
                                const Text('Intentos',
                                style: TextStyle(
                                  fontSize: 20
                                ),),
                              ],
                            ),
                          ),
                          SizedBox(height: MediaQuery.sizeOf(context).height*0.05,),
                          Container(
                            decoration:const  BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            width: MediaQuery.sizeOf(context).width * 0.3,
                            height: MediaQuery.sizeOf(context).height *0.12,
                            child: Row(
                              children: [
                                SizedBox(width: MediaQuery.sizeOf(context).width*0.04,),
                                Image.asset('assets/img/aciertos_icon.png',
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover,
                                ),
                                SizedBox(width: MediaQuery.sizeOf(context).width*0.02,),
                                const Text('Aciertos',
                                style: TextStyle(
                                  fontSize: 20
                                ),),
                              ],
                            ),
                          ),
                          SizedBox(height: MediaQuery.sizeOf(context).height*0.05,),
                          Container(
                            decoration:const  BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            width: MediaQuery.sizeOf(context).width * 0.3,
                            height: MediaQuery.sizeOf(context).height *0.12,
                            child: Row(
                              children: [
                                SizedBox(width: MediaQuery.sizeOf(context).width*0.04,),
                                Image.asset('assets/img/errores_icon.png',
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover,
                                ),
                                SizedBox(width: MediaQuery.sizeOf(context).width*0.02,),
                                const Text('Errores',
                                style: TextStyle(
                                  fontSize: 20
                                ),),
                              ],
                            ),
                          ),
                          SizedBox(height: MediaQuery.sizeOf(context).height*0.05,),
                          
                        ],
                      ),
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
}
