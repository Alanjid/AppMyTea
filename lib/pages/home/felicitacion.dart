import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:untitled/pages/Actividades/actividades_rutina_diaria.dart';
import 'package:untitled/pages/home/niveles_de_actividades.dart';
class felicitacion extends StatefulWidget {

  final String photo;
  final double width;
  final double heigth;
  felicitacion(  { required this.photo, required this.width, required this.heigth}) : super();
  @override
  felicitacion2 createState()=> felicitacion2(photo: photo, width: width, heigth: heigth);
}

class felicitacion2 extends State {
  felicitacion2(  { required this.photo, required this.width, required this.heigth}) : super();

  final String photo;
  final double width;
  final double heigth;
  final controller= ConfettiController();
  bool play=true;

  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds:6), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => rutina_diaria()));
    });
    controller.addListener(() {
      play=controller.state==ConfettiControllerState.playing;
    });
    if(play==true){
      soundpool();
      controller.play();}
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StrokeText(
              text: 'EXCELENTE TRABAJO',
              strokeWidth: 4.5,
              strokeColor: Colors.black,
              textStyle: TextStyle(
                fontSize: 28,
                fontFamily: 'lazydog',
              ),
            ),
          ],
        ),
      ),
      body:
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child:Container(
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              ConfettiWidget(
                confettiController: controller,
                shouldLoop: true,
                blastDirectionality: BlastDirectionality.explosive,
              ),
              SizedBox(
                width: width ,
                height: heigth,
                child: Image.asset(
                  photo,
                  fit: BoxFit.contain,
                ),),
              ConfettiWidget(
                confettiController: controller,
                shouldLoop: true,
                blastDirectionality: BlastDirectionality.explosive,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
Future<void> soundpool() async {
  Soundpool pool = Soundpool();

  int soundId = await rootBundle.load('assets/audios/bien_hecho.mp3').then((ByteData soundData) {
    return pool.load(soundData);
  });
  int streamId = await pool.play(soundId);
}
/*SizedBox(
           width: width ,
           height: heigth,
           child: Image.asset(
             photo,
             fit: BoxFit.contain,
           ),
             ConfettiWidget(
                 confettiController: controller
             ),
         ),*/