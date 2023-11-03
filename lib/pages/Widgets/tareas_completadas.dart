import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';
import '../home/grabar_instrucciones.dart';
class tareas_comp_diarias extends StatelessWidget {

  String Texto_TC="HAS COMPLETADO TUS ACTIVIDADES DEL DIA, VUELVE MAÑANA PARA SEGUIR TRABAJANDO.";
  String audioUrl="";
  ValueNotifier<bool> isAudioPlaying = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sonido_grabar(
              texto_grabar: Texto_TC,
              audioPath: audioUrl,
            ),
            SizedBox(width: 300),
            Image.asset(
              'assets/img/logo.png',
              width: 60,
              height: 60,
            ),
          ],
        ),
        elevation: 0,
        toolbarHeight: 50,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image(
                image: AssetImage(
                  'assets/img/alerta.png'
                ),
              width: 200,
              height: 200,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StrokeText(
                    text: 'HAS COMPLETADO TUS',
                  strokeWidth: 6,
                  strokeColor: Colors.black,
                  textStyle: TextStyle(
                    fontSize: 28,
                    fontFamily: 'lazydog'
                  ),
                ),
                StrokeText(
                  text: 'ACTIVIDADES DEL DIA, VUELVE ',
                  strokeWidth: 6,
                  strokeColor: Colors.black,
                  textStyle: TextStyle(
                      fontSize: 28,
                      fontFamily: 'lazydog'
                  ),
                ),
                StrokeText(
                  text: 'MAÑANA PARA SEGUIR',
                  strokeWidth: 6,
                  strokeColor: Colors.black,
                  textStyle: TextStyle(
                      fontSize: 28,
                      fontFamily: 'lazydog'
                  ),
                ),
                StrokeText(
                  text: 'TRABAJANDO',
                  strokeWidth: 6,
                  strokeColor: Colors.black,
                  textStyle: TextStyle(
                      fontSize: 28,
                      fontFamily: 'lazydog'
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
