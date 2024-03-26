import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/instance_manager.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:soundpool/soundpool.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:untitled/pages/Actividades/Higiene/h1_ba%C3%B1o/aprende_pony_real_controller.dart';
import 'package:untitled/pages/home/felicitacion.dart';
import 'package:untitled/utils/colors.dart' as utils;

class apren_pony_lenguaje_real extends StatefulWidget {
  @override
  afre createState() => afre();
}

class afre extends State {
  @override
  bool visible = false, visible2 = false, visible3 = false, visible4 = false;
  String Texto = "¿Que objetos encuentras en el baño?";
  String audioUrl = 'assets/audios/act_bañoH.mp3';
  late Soundpool _soundpool;
  late int _soundId;
  late int _streamId;
  late Timer Repite;
  double _sliderValue = 50.0;
  double _volume = 0.5;
  int _selectedSwitch = 0;
  aprende_pony_controller con = Get.put(aprende_pony_controller());

  void initState() {
    super.initState();
    _initializeSound();
    startTimer();
  }

  Widget build(BuildContext context) {
    if (visible == true &&
        visible2 == true &&
        visible3 == true &&
        visible4 == true) {
      Future.delayed(Duration(seconds: 1), () {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.scale,
          showCloseIcon: true,
          title: "Inicio Sesion",
          desc: "¿Quiere mantener la sesion iniciada?",
          btnCancelOnPress: () {},
          btnOkOnPress: () {
            AwesomeDialog(
                context: context,
                dialogType: DialogType.success,
                animType: AnimType.scale,
                showCloseIcon: true,
                title: "",
                desc: "Inicio de sesion correcto",
                btnOkOnPress: () => con.goToMenu());
          },
        ).show();
      });
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: utils.Colors.azulitoArriba,
        elevation: 0,
        toolbarHeight: 40,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StrokeText(
              text: Texto,
              strokeWidth: 6,
              strokeColor: Colors.orange,
              textStyle: TextStyle(
                fontSize: 28,
                fontFamily: 'lazydog',
              ),
            ),
            SizedBox(width: 20),
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
                                  audioUrl = "assets/audios/act_bañoH.mp3";
                                } else {
                                  if (index == 1) {
                                    audioUrl = "assets/audiosM/act_bañoM.mp3";
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
            Image.asset(
              'assets/img/logo.png',
              width: 60,
              height: 60,
            ),
          ],
        ),
      ), //aqui termina la barra de arriba de la pagina

      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/img/fondoNM.png'), fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            scrollDirection: Axis.horizontal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 30,),
                    Stack(
                      children: [
                        Container(
                          width: 125.0,
                          height: 125.0,
                          padding: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(0),
                              border: Border.all(width: 2, color: Colors.black),
                              color: Colors.white),
                          child: IconButton(
                            onPressed: () {
                              //soundpool();
                              setState(() {
                                visible = true;
                              });
                              soundpool1();
                            },
                            icon: Image.asset(
                              'assets/img/baño_real.png',
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
                                color: Colors.blue.withOpacity(0.4)),
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
                          border: Border.all(width: 2, color: Colors.black),
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
                    SizedBox(
                      width: 86.5,
                    ),
                    Stack(
                      children: [
                        Container(
                          width: 125.0,
                          height: 125.0,
                          padding: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(0),
                              border: Border.all(width: 2, color: Colors.black),
                              color: Colors.white),
                          child: IconButton(
                            onPressed: () {
                              //soundpool();
                              setState(() {
                                visible2 = true;
                              });
                              soundpool1();
                            },
                            icon: Image.asset(
                              'assets/img/despa_papel_real.png',
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
                                color: Colors.blue.withOpacity(0.4)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 86.5,
                    ),
                    Container(
                      width: 125.0,
                      height: 125.0,
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(0),
                          border: Border.all(width: 2, color: Colors.black),
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
                  ],
                ),
                //row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 30,),
                    Container(
                      width: 125.0,
                      height: 125.0,
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(0),
                          border: Border.all(width: 2, color: Colors.black),
                          color: Colors.white),
                      child: IconButton(
                        onPressed: () {
                          soundpool2();
                        },
                        icon: Image.asset(
                          'assets/img/silla_real.png',
                          height: 200,
                          width: 200.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 86.5,
                    ),
                    Stack(
                      children: [
                        Container(
                          width: 125.0,
                          height: 125.0,
                          padding: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(0),
                              border: Border.all(width: 2, color: Colors.black),
                              color: Colors.white),
                          child: IconButton(
                            onPressed: () {
                              //soundpool();
                              setState(() {
                                visible4 = true;
                              });
                              soundpool1();
                            },
                            icon: Image.asset(
                              'assets/img/bote_basuraa_real.png',
                              height: 200,
                              width: 200.0,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: visible4,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 62, horizontal: 62),
                            decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.4)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 86.5,
                    ),
                    Stack(
                      children: [
                        Container(
                          width: 125.0,
                          height: 125.0,
                          padding: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(0),
                              border: Border.all(width: 2, color: Colors.black),
                              color: Colors.white),
                          child: IconButton(
                            onPressed: () {
                              //soundpool();
                              setState(() {
                                visible3 = true;
                              });
                              soundpool1();
                            },
                            icon: Image.asset(
                              'assets/img/lavabo_real.png',
                              height: 200,
                              width: 200.0,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: visible3,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 62, horizontal: 62),
                            decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.4)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 86.5,
                    ),
                    Container(
                      width: 125.0,
                      height: 125.0,
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(0),
                          border: Border.all(width: 2, color: Colors.black),
                          color: Colors.white),
                      child: IconButton(
                        onPressed: () {
                          soundpool2();
                        },
                        icon: Image.asset(
                          'assets/img/tijeras_real.png',
                          height: 200,
                          width: 200.0,
                        ),
                      ),
                    ),
                  ],
                ), //this
              ],
            ),
          )),
    );
  } //fin constructor

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

  Future<void> _setVolume(double newVolume) async {
    await _soundpool.setVolume(soundId: _soundId, volume: newVolume);
    setState(() {
      _volume = newVolume;
      _sliderValue = newVolume * 100;
    });
  }

  @override
  void dispose() {
    Repite.cancel(); // Cancelar el temporizador antes de liberar el widget
    _soundpool.release();
    super.dispose();
  }

  void startTimer() {
    Repite = Timer.periodic(Duration(seconds: 10), (timer) {
      _initializeSound();
    });
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
