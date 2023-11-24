import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:untitled/utils/colors.dart' as utils;

class rutina_diaria extends StatefulWidget {
  @override
  _actR_diariaState createState() => _actR_diariaState();
}

class _actR_diariaState extends State<rutina_diaria> {
  String texto_dictar="Realizamos las actividades de rutina diaria";
  String audioUrl="assets/audios/audio_rutina_diariaH.mp3";
  ValueNotifier<bool> isAudioPlaying = ValueNotifier<bool>(false);
  late List<String> ActividadesList;
  late Soundpool _soundpool;
  late int _soundId;
  late int _streamId;
  late Timer Repite;
  double _sliderValue=50.0;
  double _volume = 0.5;
  int _selectedSwitch=0;

  void initState() {
    super.initState();
    _initializeSound();
    startTimer();
    ActividadesList = [
      'assets/img/alimento.png',
      'assets/img/bebidas.png',
      'assets/img/acciones.png',
      'assets/img/partes del cuerpo.png',
      'assets/img/prendas.png',
      'assets/img/matemáticas.png'
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
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text('Cambiamos la voz',
                          textAlign: TextAlign.center,),
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
                              activeBgColors: [[Colors.blue],[Colors.pink]],
                              onToggle: (index) {
                                setState(() {
                                  _selectedSwitch=index!;
                                });
                                print('switched to: $index');
                                if(index == 0){
                                  audioUrl="assets/audios/audio_rutina_diariaH.mp3";
                                }
                                else{
                                  if(index == 1){
                                    audioUrl="assets/audiosM/audio_rutina_diariaM.mp3";
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
                                  decoration: TextDecoration.underline
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                );
              },
              icon: Image.asset('assets/img/iconobocina.gif'),
              iconSize: 70,
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
              image: AssetImage('assets/img/fondoNM.png'),
              fit: BoxFit.cover
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
            SizedBox(
              height: 20,
            ),
            StrokeText(
              text: texto_dictar,
              strokeWidth: 6,
              strokeColor: Colors.green,
              textStyle: TextStyle(
                fontSize: 38,
                fontFamily: 'lazydog',
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 150,
                  width: MediaQuery.sizeOf(context).width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ActividadesList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: Image.asset(
                            ActividadesList[index],
                            width: 120,
                            height: 120,
                          ),
                          onPressed: () {
                            // Tu lógica cuando se presiona el botón
                          },
                          iconSize: 120, // Ajusta el tamaño del icono según tus necesidades
                          padding: EdgeInsets.all(8), // Ajusta el relleno según tus necesidades
                          color: Colors.blue, // Ajusta el color del icono según tus necesidades
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _setVolume(double newVolume) async {
    await _soundpool.setVolume(soundId: _soundId, volume: newVolume);
    setState(() {
      _volume = newVolume;
      _sliderValue=newVolume *100;
    });
  }


  void startTimer() {
    Repite =Timer.periodic(Duration(seconds: 10), (timer) {
      _initializeSound();
    });
  }

  @override
  void dispose() {
    Repite.cancel();  // Cancelar el temporizador antes de liberar el widget
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
