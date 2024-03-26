import 'dart:async';
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

/// Flutter code sample for [LinearProgressIndicator].

class carga_bano_realista extends StatefulWidget {
  const carga_bano_realista({super.key});

  @override
  State<carga_bano_realista> createState() => _ProgressIndicatorExampleState();
}

class _ProgressIndicatorExampleState extends State<carga_bano_realista>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool determinate = false;
  int dura = 3;
  double progreso = 0;
  int menos = 10;

  void _startCountDown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (menos > 0) {
        // musicamovimiento();
        setState(() {
          //if(menos==15||menos==10){musicamovimiento();}
          menos = menos - 1;
        });
      } else {
        timer.cancel();
        //menos=15;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //_startCountDown();
    /* Future.delayed(Duration(seconds:6), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => apren_pony_lenguaje_real()));
    });
    //startTimer();*/
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 40,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StrokeText(
              text: 'OBSERVA EL BAÑO',
              strokeWidth: 4.5,
              strokeColor: Colors.black,
              textStyle: TextStyle(
                fontSize: 25,
                fontFamily: 'lazydog',
              ),
            ),
          ],
        ),
      ),
      body:
          //LinearProgressIndicator(),
          Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      menos == 0 ? ' Tiempo' '\n' 'Agotado' : menos.toString(),
                      style: TextStyle(fontSize: 55),
                    ),
                    MaterialButton(
                      onPressed: () {
                        _startCountDown();
                      },
                      child: const Text(
                        'COMENZAR',
                        style: TextStyle(fontSize: 27, color: Colors.white),
                        // color: Colors.deepPurpleAccent,
                      ),
                      color: Colors.deepPurpleAccent,
                    ),
                  ],
                ),
                SizedBox(
                  width: 50,
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(width: 4, color: Colors.deepPurpleAccent),
                      color: Colors.white),
                  child: Image.asset(
                    'assets/img/baño_realista.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
