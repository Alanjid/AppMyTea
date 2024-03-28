import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:untitled/pages/home/felicitacion.dart';
import 'package:soundpool/soundpool.dart';
import '../../../Widgets/Objetivos.dart';
import 'package:untitled/utils/colors.dart' as utils;

class decir_hola extends StatefulWidget {
  const decir_hola({super.key});

  @override
  State<decir_hola> createState() => _decir_hola();
}

class _decir_hola extends State <decir_hola>{
  bool visible = false, visible2 = false;
    String Texto_act =
        "¿Cómo se saluda a un nuevo AMIGO?";
    String audioUrl = "assets/audios/audio_act_afectividadH.mp3";
    String objetivo = "Mostrar la forma para saludar a alguien nuevo";
    String instruccion = "Dar click en los botones para escuchar la frase y repetirla";
    String materiales = "no necesario";
    String img = "";
    late Soundpool _soundpool;
    late int _soundId;
    late int _streamId;
    late Timer Repite;
    double _sliderValue = 50.0;
    double _volume =
    0.5; // Agrega _volume como una propiedad y establece el valor inicial
    int _selectedSwitch = 0;
  @override
  Widget build(BuildContext context) {

    void initState() {
    super.initState();
    _initializeSound();
    startTimer();
  }

    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(),
    );
  }//fin widget

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


}//fin class hola

