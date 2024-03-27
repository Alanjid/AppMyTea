import 'package:flutter/material.dart';
import 'dart:async';
import 'package:soundpool/soundpool.dart';
import 'package:flutter/cupertino.dart';

abstract class decir_hola extends StatefulWidget {
  const decir_hola({super.key});
  @override
  _decir_hola createState() => _decir_hola();
}

class _decir_hola extends State <decir_hola>{
  @override
  Widget build(BuildContext context) {
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



    throw UnimplementedError();
  }//fin widget
}//fin class hola


