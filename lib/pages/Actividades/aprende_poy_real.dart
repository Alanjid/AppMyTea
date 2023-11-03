import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:soundpool/soundpool.dart';
import 'package:untitled/pages/home/felicitacion.dart';
import 'package:audioplayers/audioplayers.dart';
import '../home/grabar_instrucciones.dart';
import '../Widgets/info_actividades.dart';

class apren_pony_lenguaje_real extends StatefulWidget {
  @override
  afre createState()=> afre();
}

class afre extends State {
  @override
  bool visible=false,visible2=false,visible3=false,visible4=false;
  String Texto = "¿Que objetos encuentras en el baño?";
  String audioUrl = 'assets/audios/menu.mp3';


  void initState() {
    super.initState();
    startTimer();
  }
  Widget build(BuildContext context) {
    if(visible==true && visible2==true && visible3==true && visible4==true) {
      Future.delayed(Duration(seconds:1), () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>
            felicitacion(
                photo: 'assets/img/felicitar.png', width: 400, heigth: 400)));
      });
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 40,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sonido_grabar(
              texto_grabar: Texto,
              audioPath: audioUrl,
            ),
            StrokeText(
              text: Texto,
              strokeWidth: 6,
              strokeColor: Colors.orange,
              textStyle: TextStyle(
                fontSize: 28,
                fontFamily: 'lazydog',
              ),
            ),
            SizedBox(width: 300),
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
              image: AssetImage('assets/img/fondoNM.png'),
              fit: BoxFit.cover
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children:[
                    Container(
                      width:125.0,
                      height: 125.0,
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(0),
                          border: Border.all(width: 2,color: Colors.black),
                          color: Colors.white
                      ),
                      child: IconButton(
                        onPressed: (){
                          //soundpool();
                          setState(()  {
                            visible=true;
                          });
                          soundpool();
                        },
                        icon: Image.asset('assets/img/baño_real.png',height: 200,width: 200.0,),
                      ),
                    ),
                    Visibility(
                      visible: visible,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 62, horizontal: 62),
                        decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.4)
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 86.5,
                ),
                //Boton Matemáticas
                Container(
                  width:125.0,
                  height: 125.0,
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(width: 2,color: Colors.black),
                      color: Colors.white
                  ),
                  child: IconButton(
                    onPressed: (){
                      soundpool2();
                    },
                    icon: Image.asset('assets/img/platanos.png',height: 200,width: 200.0,),
                  ),
                ),
                SizedBox(
                  width: 86.5,
                ),
                Stack(
                  children:[
                    Container(
                      width:125.0,
                      height: 125.0,
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(0),
                          border: Border.all(width: 2,color: Colors.black),
                          color: Colors.white
                      ),
                      child: IconButton(
                        onPressed: (){
                          //soundpool();
                          setState(()  {
                            visible2=true;
                          });
                          soundpool();
                        },
                        icon: Image.asset('assets/img/despa_papel_real.png',height: 200,width: 200.0,),
                      ),
                    ),
                    Visibility(
                      visible: visible2,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 62, horizontal: 62),
                        decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.4)
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 86.5,
                ),
                Container(
                  width:125.0,
                  height: 125.0,
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(width: 2,color: Colors.black),
                      color: Colors.white
                  ),
                  child: IconButton(
                    onPressed: (){
                      soundpool2();
                    },
                    icon: Image.asset('assets/img/pelotar.png',height: 200,width: 200.0,),
                  ),
                ),
              ],
            ),
            //row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width:125.0,
                  height: 125.0,
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(width: 2,color: Colors.black),
                      color: Colors.white
                  ),
                  child: IconButton(
                    onPressed: (){
                      soundpool2();
                    },
                    icon: Image.asset('assets/img/silla_real.png',height: 200,width: 200.0,),
                  ),
                ),
                SizedBox(
                  width: 86.5,
                ),
                Stack(
                  children:[
                    Container(
                      width:125.0,
                      height: 125.0,
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(0),
                          border: Border.all(width: 2,color: Colors.black),
                          color: Colors.white
                      ),
                      child: IconButton(
                        onPressed: (){
                          //soundpool();
                          setState(()  {
                            visible4=true;
                          });
                          soundpool();
                        },
                        icon: Image.asset('assets/img/bote_basuraa_real.png',height: 200,width: 200.0,),
                      ),
                    ),
                    Visibility(
                      visible: visible4,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 62, horizontal: 62),
                        decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.4)
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 86.5,
                ),
                Stack(
                  children:[
                    Container(
                      width:125.0,
                      height: 125.0,
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(0),
                          border: Border.all(width: 2,color: Colors.black),
                          color: Colors.white
                      ),
                      child: IconButton(
                        onPressed: (){
                          //soundpool();
                          setState(()  {
                            visible3=true;
                          });
                          soundpool();
                        },
                        icon: Image.asset('assets/img/lavabo_real.png',height: 200,width: 200.0,),
                      ),
                    ),
                    Visibility(
                      visible: visible3,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 62, horizontal: 62),
                        decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.4)
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 86.5,
                ),
                Container(
                  width:125.0,
                  height: 125.0,
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(width: 2,color: Colors.black),
                      color: Colors.white
                  ),
                  child: IconButton(
                    onPressed: (){
                      soundpool2();
                    },
                    icon: Image.asset('assets/img/tijeras_real.png',height: 200,width: 200.0,),
                  ),
                ),

              ],
            ),//this
          ],
        ),
      ),
    );
  } //fin constructor

  Future<void> soundpool() async {
    Soundpool pool = Soundpool();

    int soundId = await rootBundle.load('assets/audios/acierto.mp3').then((ByteData soundData) {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);
  }

  Future<void> soundpool2() async {
    Soundpool pool = Soundpool();

    int soundId = await rootBundle.load('assets/audios/error.mp3').then((ByteData soundData) {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);
  }

  Future<void> audioFondo() async {
    Soundpool pool = Soundpool();

    int soundId = await rootBundle.load('assets/audios/act_baño.mp3').then((ByteData soundData) {
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