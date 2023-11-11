import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:untitled/pages/Widgets/Objetivos.dart';
import 'package:untitled/pages/home/principal.dart';
import 'grabar_instrucciones.dart';

class saludo extends StatefulWidget {
  @override
  _saludoState createState() => _saludoState();
}

class _saludoState extends State<saludo> {
  String Texto_Saludo="HOLA BIENVENIDO";
  String audioUrl="assets/audios/bienvenida-hombre.mp3";

  void initState() {
    super.initState();
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
            sonido_grabar(
              texto_grabar: Texto_Saludo,
              audioPath: audioUrl,
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
  Future<void> audioFondo() async {
    Soundpool pool = Soundpool();

    int soundId = await rootBundle.load(audioUrl).then((ByteData soundData) {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);
  }
  void startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      audioFondo();
    });
  }
}
