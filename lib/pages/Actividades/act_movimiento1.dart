import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:soundpool/soundpool.dart';

import '../Widgets/grabar_instrucciones.dart';

class movi_conejo extends StatefulWidget {
  //_HomePageState createState()=> _HomePageState();
  // const movi_conejo(  { required this.photo, required this.onTap, required this.width}) : super();
  // _HomePageState createState()=> _HomePageState();


  /* final String photo;
  final VoidCallback onTap;
  final double width;*/


  @override
  _HomePageState createState()=> _HomePageState();

}


class _HomePageState extends State {
  String Instruccion="VAMOS A MOVERNOS";
  String audioUrl="assets/audios/vamos_a_movernosH.mp3";

  int menos =15;
  void _startCountDown() {
    Timer.periodic(Duration(seconds: 1), (timer)   {
      if (menos > 0) {
        // musicamovimiento();
        setState(()  {
          //if(menos==15||menos==10){musicamovimiento();}
          menos = menos - 1;
        });
      }
      else {
        timer.cancel();
        //menos=15;
      }
    });
    menos=16;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StrokeText(
              text: Instruccion,
              strokeWidth: 6,
              strokeColor: Colors.deepPurpleAccent,
              textStyle: TextStyle(
                fontSize: 30,
                fontFamily: 'lazydog',
              ),
            ),
            sonido_grabar(
              texto_grabar: Instruccion,
              audioPath: audioUrl,
              onVolumeChanged: (newVolume){
                print('Nuevo volumen: $newVolume');
              },
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  menos==0?'  ¡BIEN ''\n''HECHO!':menos.toString(),
                  style: TextStyle(fontSize: 50),
                ),
                MaterialButton(onPressed: () {
                  _startCountDown();
                },
                  child: const Text('COMENZAR',style: TextStyle(fontSize: 27,color:Colors.white),
                    // color: Colors.deepPurpleAccent,
                  ),
                  color: Colors.deepPurpleAccent,
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 4,color: Colors.deepPurpleAccent),
                  color: Colors.white
              ),
              child: Image.asset(
                'assets/img/movimiento1.gif',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }


  Future<void> musicamovimiento() async{
    Soundpool pool = Soundpool();
    int soundId = await rootBundle.load('assets/img/musicamovi.mp3').then((ByteData soundData) {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);
  }

}