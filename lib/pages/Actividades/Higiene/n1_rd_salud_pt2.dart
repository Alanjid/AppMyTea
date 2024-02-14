import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:soundpool/soundpool.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../Widgets/salud_abrir_animacion.dart';
import 'package:untitled/utils/colors.dart' as utils;

class n1_rd_salud_pt2 extends StatefulWidget {
  const n1_rd_salud_pt2({super.key});

  @override
  n1_rd_salu createState()=> n1_rd_salu();
}

class n1_rd_salu extends State {
  String audioUrl="assets/audios/nos_lavamos_las_manosH.mp3";
  String Instruccion="Nos lavamos las manos";
  late Soundpool _soundpool;
  late int _soundId;
  late int _streamId;
  late Timer Repite;
  double _sliderValue=50.0;
  double _volume = 0.5; // Agrega _volume como una propiedad y establece el valor inicial
  int _selectedSwitch = 0;

  @override
  void initState() {
    super.initState();
    _initializeSound();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StrokeText(
              text: Instruccion,
              strokeWidth: 6,
              strokeColor: Colors.green,
              textStyle: const TextStyle(
                fontSize: 28,
                fontFamily: 'lazydog',
              ),
            ),
            IconButton(
              onPressed: () {

                showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: const Text('Cambiamos la voz',
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
                              labels: const ['Hombre', 'Mujer'],
                              icons: const [Icons.male, Icons.female],
                              activeBgColors: const [[Colors.blue],[Colors.pink]],
                              onToggle: (index) {
                                setState(() {
                                  _selectedSwitch=index!;
                                });
                                print('switched to: $index');
                                if(index == 0){
                                  audioUrl="assets/audios/nos_lavamos_las_manosH.mp3";
                                }
                                else{
                                  if(index == 1){
                                    audioUrl="";
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
          ],
        ),
      ),
      body: Container(

        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img/fondoNM.png'),
              fit: BoxFit.cover
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width:35.0,
                  height: 35.0,
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 0,),
                StrokeText(
                  text: 'ABRIR',
                  strokeWidth: 4,
                  strokeColor: Colors.green,
                  textStyle: TextStyle(
                    fontFamily: 'lazydog',
                    fontSize: 25,
                  ),
                ),
                SizedBox(width: 10,),
                StrokeText(
                  text: 'AGUA',
                  strokeWidth: 4,
                  strokeColor: Colors.green,
                  textStyle: TextStyle(
                    fontFamily: 'lazydog',
                    fontSize: 25,
                  ),
                ),
                SizedBox(width: 8,),
                StrokeText(
                  text: 'CERRAR',
                  strokeWidth: 4,
                  strokeColor: Colors.green,
                  textStyle: TextStyle(
                    fontFamily: 'lazydog',
                    fontSize: 25,
                  ),
                ),
                SizedBox(width: 8,),
                StrokeText(
                  text: 'JABÓN',
                  strokeWidth: 4,
                  strokeColor: Colors.green,
                  textStyle: TextStyle(
                    fontFamily: 'lazydog',
                    fontSize: 25,
                  ),
                ),
                SizedBox(width: 0,),
                StrokeText(
                  text: 'ENJABONAR',
                  strokeWidth: 4,
                  strokeColor: Colors.green,
                  textStyle: TextStyle(
                    fontFamily: 'lazydog',
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width:90.0,
                  height: 90.0,
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 2,color: Colors.green),
                      color: Colors.white
                  ),
                  child: salud_abrir_animacion(
                    photo: 'assets/img/abrir.png',
                    width: 100.0,
                    heigth: 200,
                    onTap: () {//esto son las acciones que hará cuando se de click en la imagen
                      soundpool();
                      Navigator.of(context).push(MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return Scaffold(
                              appBar: AppBar(
                                title: const Text('LAVAR MANOS'),
                              ),
                              body: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                padding: const EdgeInsets.all(16),
                                alignment: Alignment.center,
                                child: salud_abrir_animacion(
                                  photo: 'assets/img/abrir_real.png',
                                  width: 700.0,
                                  heigth: 700,
                                  onTap: () {
                                    Navigator.of(context).pop();//hace que regrese a la ultima ventana
                                  },
                                ),
                              ),

                            );
                          }
                      ));
                    },
                  ),
                ),
                Container(
                  width:90.0,
                  height: 90.0,
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 2,color: Colors.green),
                      color: Colors.white
                  ),
                  child: salud_abrir_animacion(
                    photo: 'assets/img/enjuagar.png',
                    width: 100.0,
                    heigth: 200,
                    onTap: () {//esto son las acciones que hará cuando se de click en la imagen
                      soundpool2();
                      Navigator.of(context).push(MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return Scaffold(
                              appBar: AppBar(
                                title: const Text('LAVAR MANOS'),
                              ),
                              body: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                padding: const EdgeInsets.all(16),
                                alignment: Alignment.center,
                                child: salud_abrir_animacion(
                                  photo: 'assets/img/agua_real.png',
                                  width: 700.0,heigth: 700,
                                  onTap: () {
                                    Navigator.of(context).pop();//hace que regrese a la ultima ventana
                                  },
                                ),
                              ),

                            );
                          }
                      ));
                    },
                  ),
                ),
                Container(
                  width:90.0,
                  height: 90.0,
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 2,color: Colors.green),
                      color: Colors.white
                  ),
                  child: salud_abrir_animacion(
                    photo: 'assets/img/cerrar.png',
                    width: 100.0,heigth: 200,
                    onTap: () {//esto son las acciones que hará cuando se de click en la imagen
                      soundpool3();
                      Navigator.of(context).push(MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return Scaffold(
                              appBar: AppBar(
                                title: const Text('LAVAR MANOS'),
                              ),
                              body: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                padding: const EdgeInsets.all(16),
                                alignment: Alignment.center,
                                child: salud_abrir_animacion(
                                  photo: 'assets/img/cerrar_real.png',
                                  width: 700.0,heigth: 700,
                                  onTap: () {
                                    Navigator.of(context).pop();//hace que regrese a la ultima ventana
                                  },
                                ),
                              ),

                            );
                          }
                      ));
                    },
                  ),
                ),
                Container(
                  width:90.0,
                  height: 90.0,
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 2,color: Colors.green),
                      color: Colors.white
                  ),
                  child: salud_abrir_animacion(
                    photo: 'assets/img/jabon.png',
                    width: 100.0,heigth: 200,
                    onTap: () {//esto son las acciones que hará cuando se de click en la imagen
                      soundpool4();
                      Navigator.of(context).push(MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return Scaffold(
                              appBar: AppBar(
                                title: const Text('LAVAR MANOS'),
                              ),
                              body: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                padding: const EdgeInsets.all(16),
                                alignment: Alignment.center,
                                child: salud_abrir_animacion(
                                  photo: 'assets/img/jabon_real.png',
                                  width: 700.0,heigth: 700,
                                  onTap: () {
                                    Navigator.of(context).pop();//hace que regrese a la ultima ventana
                                  },
                                ),
                              ),

                            );
                          }
                      ));
                    },
                  ),
                ),
                Container(
                  width:90.0,
                  height: 90.0,
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 2,color: Colors.green),
                      color: Colors.white
                  ),
                  child: salud_abrir_animacion(
                    photo: 'assets/img/enjabonar.png',
                    width: 100.0,heigth: 200,
                    onTap: () {//esto son las acciones que hará cuando se de click en la imagen
                      soundpool5();
                      Navigator.of(context).push(MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return Scaffold(
                              appBar: AppBar(
                                title: const Text('LAVAR MANOS'),
                              ),
                              body: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                padding: const EdgeInsets.all(16),
                                alignment: Alignment.center,
                                child: salud_abrir_animacion(
                                  photo: 'assets/img/enjuagar_real.png',
                                  width: 700.0,heigth: 700,
                                  onTap: () {
                                    Navigator.of(context).pop();//hace que regrese a la ultima ventana
                                  },
                                ),
                              ),

                            );
                          }
                      ));
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 20,),
                StrokeText(
                  text: 'ABRIR',
                  strokeWidth: 4,
                  strokeColor: Colors.green,
                  textStyle: TextStyle(
                    fontFamily: 'lazydog',
                    fontSize: 25,
                  ),
                ),
                SizedBox(width: 60,),
                StrokeText(
                  text: 'TALLAR',
                  strokeWidth: 4,
                  strokeColor: Colors.green,
                  textStyle: TextStyle(
                    fontFamily: 'lazydog',
                    fontSize: 25,
                  ),
                ),
                SizedBox(width: 70,),
                StrokeText(
                  text: 'LIMPIAR',
                  strokeWidth: 4,
                  strokeColor: Colors.green,
                  textStyle: TextStyle(
                    fontFamily: 'lazydog',
                    fontSize: 25,
                  ),
                ),
                SizedBox(width: 50,),
                StrokeText(
                  text: 'CERRAR',
                  strokeWidth: 4,
                  strokeColor: Colors.green,
                  textStyle: TextStyle(
                    fontFamily: 'lazydog',
                    fontSize: 25,
                  ),
                ),
                SizedBox(width: 65,),
                StrokeText(
                  text: 'SECAR',
                  strokeWidth: 4,
                  strokeColor: Colors.green,
                  textStyle: TextStyle(
                    fontFamily: 'lazydog',
                    fontSize: 25,
                  ),
                ),
                SizedBox(width: 10,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width:90.0,
                  height: 90.0,
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 2,color: Colors.green),
                      color: Colors.white
                  ),
                  child:  salud_abrir_animacion(
                    photo: 'assets/img/abrir.png',
                    width: 100.0,heigth: 200,
                    onTap: () {//esto son las acciones que hará cuando se de click en la imagen
                      soundpool();
                      Navigator.of(context).push(MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return Scaffold(
                              appBar: AppBar(
                                title: const Text('LAVAR MANOS'),
                              ),
                              body: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                padding: const EdgeInsets.all(16),
                                alignment: Alignment.center,
                                child: salud_abrir_animacion(
                                  photo: 'assets/img/abrir_real.png',
                                  width: 700.0,heigth: 700,
                                  onTap: () {
                                    Navigator.of(context).pop();//hace que regrese a la ultima ventana
                                  },
                                ),
                              ),

                            );
                          }
                      ));
                    },
                  ),
                ),
                Container(
                  width:90.0,
                  height: 90.0,
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 2,color: Colors.green),
                      color: Colors.white
                  ),
                  child:  salud_abrir_animacion(
                    photo: 'assets/img/tallar1.png',
                    width: 100.0,heigth: 200,
                    onTap: () {//esto son las acciones que hará cuando se de click en la imagen
                      soundpool6();
                      Navigator.of(context).push(MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return Scaffold(
                              appBar: AppBar(
                                title: const Text('LAVAR MANOS'),
                              ),
                              body: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                padding: const EdgeInsets.all(16),
                                alignment: Alignment.center,
                                child: salud_abrir_animacion(
                                  photo: 'assets/img/enjuagar_real.png',
                                  width: 700.0,heigth: 700,
                                  onTap: () {
                                    Navigator.of(context).pop();//hace que regrese a la ultima ventana
                                  },
                                ),
                              ),

                            );
                          }
                      ));
                    },
                  ),
                ),
                Container(
                  width:90.0,
                  height: 90.0,
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 2,color: Colors.green),
                      color: Colors.white
                  ),
                  child: salud_abrir_animacion(
                    photo: 'assets/img/enjuagar.png',
                    width: 100.0,heigth: 200,
                    onTap: () {//esto son las acciones que hará cuando se de click en la imagen
                      soundpool7();
                      Navigator.of(context).push(MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return Scaffold(
                              appBar: AppBar(
                                title: const Text('LAVAR MANOS'),
                              ),
                              body: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                padding: const EdgeInsets.all(16),
                                alignment: Alignment.center,
                                child: salud_abrir_animacion(
                                  photo: 'assets/img/agua_real.png',
                                  width: 700.0,heigth: 700,
                                  onTap: () {
                                    Navigator.of(context).pop();//hace que regrese a la ultima ventana
                                  },
                                ),
                              ),

                            );
                          }
                      ));
                    },
                  ),
                ),
                Container(
                  width:90.0,
                  height: 90.0,
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 2,color: Colors.green),
                      color: Colors.white
                  ),
                  child: salud_abrir_animacion(
                    photo: 'assets/img/cerrar.png',
                    width: 70.0,heigth: 200,
                    onTap: () {//esto son las acciones que hará cuando se de click en la imagen
                      soundpool3();
                      Navigator.of(context).push(MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return Scaffold(
                              appBar: AppBar(
                                title: const Text('LAVAR MANOS'),
                              ),
                              body: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                padding: const EdgeInsets.all(16),
                                alignment: Alignment.center,
                                child: salud_abrir_animacion(
                                  photo: 'assets/img/cerrar_real.png',
                                  width: 700.0,heigth: 700,
                                  onTap: () {
                                    Navigator.of(context).pop();//hace que regrese a la ultima ventana
                                  },
                                ),
                              ),

                            );
                          }
                      ));
                    },
                  ),
                ),
                Container(
                  width:90.0,
                  height: 90.0,
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(width: 2,color: Colors.green),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: salud_abrir_animacion(
                    photo: 'assets/img/secar.png',
                    width: 70.0,heigth: 200,
                    onTap: () {//esto son las acciones que hará cuando se de click en la imagen
                      soundpool8();
                      Navigator.of(context).push(MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                            return Scaffold(
                              appBar: AppBar(
                                title: const Text('LAVAR MANOS'),
                              ),
                              body: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                padding: const EdgeInsets.all(16),
                                alignment: Alignment.center,
                                child: salud_abrir_animacion(
                                  photo: 'assets/img/secar_real.png',
                                  width: 700.0,heigth: 700,
                                  onTap: () {
                                    Navigator.of(context).pop();//hace que regrese a la ultima ventana
                                  },
                                ),
                              ),

                            );
                          }
                      ));
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

  Future<void> soundpool() async {
    Soundpool pool = Soundpool();

    int soundId = await rootBundle.load('assets/img/torettoabrir.wav').then((ByteData soundData) {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);
  }

  Future<void> soundpool2() async {
    Soundpool pool = Soundpool();

    int soundId = await rootBundle.load('assets/img/agua.wav').then((ByteData soundData) {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);
  }//fin soundpool2

  Future<void> soundpool3() async {
    Soundpool pool = Soundpool();

    int soundId = await rootBundle.load('assets/img/cerrar.wav').then((ByteData soundData) {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);
  }//fin soundpool3

  Future<void> soundpool4() async {
    Soundpool pool = Soundpool();

    int soundId = await rootBundle.load('assets/img/jabon.wav').then((ByteData soundData) {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);
  }//fin soundpool4

  Future<void> soundpool5() async {
    Soundpool pool = Soundpool();

    int soundId = await rootBundle.load('assets/img/enjabonar.wav').then((ByteData soundData) {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);
  }//fin soundpool5

  Future<void> soundpool6() async {
    Soundpool pool = Soundpool();

    int soundId = await rootBundle.load('assets/img/tallar.wav').then((ByteData soundData) {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);
  }//fin soundpool6

  Future<void> soundpool7() async {
    Soundpool pool = Soundpool();

    int soundId = await rootBundle.load('assets/img/limpiar.wav').then((ByteData soundData) {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);
  }//fin soundpool7

  Future<void> soundpool8() async {
    Soundpool pool = Soundpool();

    int soundId = await rootBundle.load('assets/img/secar.wav').then((ByteData soundData) {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);
  }//fin soundpool8
  Future<void> _setVolume(double newVolume) async {
    await _soundpool.setVolume(soundId: _soundId, volume: newVolume);
    setState(() {
      _volume = newVolume;
      _sliderValue=newVolume *100;
    });
  }


  void startTimer() {
    Repite =Timer.periodic(const Duration(seconds: 10), (timer) {
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