import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:soundpool/soundpool.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:untitled/pages/Widgets/observaciones/observaciones_controller.dart';
import 'package:untitled/utils/colors.dart' as utils;

class observaciones extends StatefulWidget {
  const observaciones({super.key});

  @override
  State<observaciones> createState() => _observacionesState();
}

class _observacionesState extends State<observaciones> {

  String Texto_Escuchar = "Enviar observaciones";
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
  
  observaciones_controller con= observaciones_controller();
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
        child:  SingleChildScrollView(
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
             const StrokeText(text: 'Envia las observaciones de la actividad',
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontFamily: 'lazydog'
              ),
              strokeColor: Colors.black,
              strokeWidth: 2,
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.sizeOf(context).width *0.6,
                    height: MediaQuery.sizeOf(context).height*0.54,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:  BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const SizedBox(
                      child: TextField(
                         keyboardType: TextInputType.multiline,
                          minLines: 1,//Normal textInputField will be displayed
                          maxLines: 5,// when user presses enter it will adapt to it
                        decoration:  InputDecoration(
                          hintText: 'Introduce la observación para enviar a los terapeutas',
                          border: InputBorder.none,
                        ),
                        
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: MediaQuery.sizeOf(context).height*0.2,),
                      ElevatedButton(onPressed: (){

                      }, 
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text('ENVIAR',
                          style: TextStyle(
                            fontSize: 20,
                            color: utils.Colors.azulitoArriba
                          ),),
                          Image.asset('assets/img/enviar_icon.png'),
                        ],
                      ),
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(onPressed: (){
                        con.goToResumen();
                      }, 
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                           Text('REGRESAR',
                          style: TextStyle(
                            fontSize: 20,
                            color: utils.Colors.azulitoArriba
                          ),),
                          Icon(Icons.arrow_back_ios_new,color: utils.Colors.azulitoArriba,
                          size: 20,)
                        ],
                      ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
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