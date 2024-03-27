import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:soundpool/soundpool.dart';

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
            Container(
              width: 50.0,
              height: 50.0,
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: Colors.deepPurpleAccent),
                  color: Colors.white
              ),
              child: IconButton(
                onPressed: () {},
                icon: Image.asset('assets/img/movimiento.png'),
                iconSize: 200,
              ),
            ),
            StrokeText(
              text: 'VAMOS A MOVERLOS',
              strokeWidth: 6,
              strokeColor: Colors.deepPurpleAccent,
              textStyle: TextStyle(
                fontSize: 30,
                fontFamily: 'lazydog',
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset('assets/img/iconobocina.gif'),
              iconSize: 60,
            ),
          ],
        ),
      ),
        body: Container(
        width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage('assets/img/fondo.png'),
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
                style: TextStyle(fontSize: 80),
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