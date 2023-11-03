import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:untitled/pages/home/felicitacion.dart';
import 'package:soundpool/soundpool.dart';
import '../Widgets/Objetivos.dart';
import '../home/grabar_instrucciones.dart';

class afectividad_realista extends StatefulWidget {
  @override
  afre createState()=> afre();
}


class afre extends State {
  @override
  bool visible=false,visible2=false;
  String Texto_act="Estos dos pequeños son amigos, escogemos los pictogramas que pueden ser los amigos de ellos?";
  String audioUrl="assets/audios/audio_act_afectividad.mp3";
  String objetivo="Trabajar la afectividad de los niños";
  String instruccion="Seleccionamos los niños que pueden ser amigos";
  String materiales="no necesario";
  String img="";

  void initState() {
    super.initState();
    startTimer();
  }

  Widget build(BuildContext context) {
    if(visible==true && visible2==true) {
      Future.delayed(Duration(seconds:2), () {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>
            felicitacion(
                photo: 'assets/img/felicitar.png', width: 400, heigth: 400)));
      });
    }
    /*if(visible==true && visible2==true) {
      Navigator.push(context, MaterialPageRoute(builder: (context) =>
          felicitacion(
              photo: 'assets/img/abraz.png', width: 400, heigth: 400)));
    }*/
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 40,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sonido_grabar(
              texto_grabar: Texto_act,
              audioPath: audioUrl,
            ),
            StrokeText(
              text: "¿Les gusta hacer amigos?",
              strokeWidth: 6,
              strokeColor: Colors.orange,
              textStyle: TextStyle(
                fontSize: 28,
                fontFamily: 'lazydog',
              ),
            ),
            SizedBox(width: 200),
            Image.asset(
              'assets/img/logo.png',
              width: 60,
              height: 60,
            ),
          ],
        ),
      ),

      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/fondoNM.png',
                    ),
                    fit: BoxFit.cover,
                  )
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Aqui irann el pony y las columnas de las actividades Pony
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Image(
                            image: AssetImage(
                                'assets/img/saludo_realista.png'
                            ),
                            width: 340,
                            height: 200,
                          ),
                          Container(
                            width: 348,
                            height: 78,
                            child: StrokeText(
                              text: 'Estos dos pequeños son amigos, '
                                  'escoge los pictogramas que pueden '
                                  'ser los amigos de ellos.',
                              strokeWidth: 4.5,
                              strokeColor: Colors.black,
                              textStyle: TextStyle(
                                fontSize: 22,
                                fontFamily: 'lazydog',
                              ),
                            ),),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                        soundpool();
                                        setState(()  {
                                          visible=true;
                                        });
                                        //soundpool();
                                      },
                                      icon: Image.asset('assets/img/niño_real.png',height: 200,width: 200.0,),
                                    ),
                                  ),
                                  Visibility(
                                    visible: visible,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 62, horizontal: 62),
                                      decoration: BoxDecoration(
                                          color: Colors.orange.withOpacity(0.4)
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
                            ],
                          ),//primeras dos imagenes
                          SizedBox(
                            height: 30.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //Boton abrazar
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
                              SizedBox(
                                width: 90,
                              ),
                              //Boton Matemáticas
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
                                        soundpool();
                                        setState(()  {
                                          visible2=true;
                                        });
                                        //soundpool();
                                      },
                                      icon: Image.asset('assets/img/niñas.png',height: 200,width: 200.0,),
                                    ),
                                  ),
                                  Visibility(
                                    visible: visible2,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 62, horizontal: 62),
                                      decoration: BoxDecoration(
                                          color: Colors.orange.withOpacity(0.4)
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
              left: 0,
              right: 0,
              child: Objetivos(
                  Objetivo: objetivo,
                  Instrucciones: instruccion,
                  Materiales: materiales,
                  imagenes: []
              ),
          ),
        ],
      )

    );
    throw UnimplementedError();
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