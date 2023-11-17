import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:untitled/pages/home/principal.dart';
import 'package:untitled/utils/colors.dart' as utils;

class saludo extends StatefulWidget {
  @override
  _saludoState createState() => _saludoState();
}

class _saludoState extends State<saludo> {
  String Texto_Saludo="HOLA BIENVENIDO";
  String audioUrl="assets/audios/bienvenida-hombre.mp3";
  late Soundpool _soundpool;
  late int _soundId;
  late int _streamId;
  late Timer Repite;
  double _sliderValue=50.0;
  double _volume = 0.5; // Agrega _volume como una propiedad y establece el valor inicial

  void initState() {
    super.initState();
    startTimer();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {


    
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 40,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                              initialLabelIndex: 1,
                              cornerRadius: 20.0,
                              activeFgColor: Colors.white,
                              inactiveBgColor: Colors.grey,
                              inactiveFgColor: Colors.white,
                              totalSwitches: 2,
                              labels: ['Hombre', 'Mujer'],
                              icons: [Icons.male, Icons.female],
                              activeBgColors: [[Colors.blue],[Colors.pink]],
                              onToggle: (index) {
                                print('switched to: $index');
                                if(index == 0){
                                  audioUrl="assets/audios/bienvenida-hombre.mp3";
                                }
                                else{
                                  if(index == 1){
                                    audioUrl="assets/audiosM/bienvenidaM.mp3";
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
            SizedBox(width: 300),
            Image.asset(
              'assets/img/logo.png',
              width: 60,
              height: 60,
            ),
            SizedBox(width: 40,),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => principal()));
              },
            ),

          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height ,
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
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20,),
                    StrokeText(
                      text: Texto_Saludo,
                      strokeWidth: 6,
                      strokeColor: Colors.indigo,
                      textStyle: TextStyle(
                          fontSize: 38,
                          fontFamily: 'lazydog'
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/img/botargapony.png', width: 200,height: 200),
                      ],
                    ),

                  ],
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
    Repite =Timer.periodic(Duration(seconds: 3), (timer) {
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
