
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:soundpool/soundpool.dart';

 // ignore: camel_case_types
 class mates_pony extends StatefulWidget {

   @override
   State<StatefulWidget> createState() => _liz();
 }

class _liz extends State{
  bool selec = true, hola= true;
  int ban=0;
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
                  border: Border.all(width: 2, color: Colors.red),
                  color: Colors.white
              ),
              child: IconButton(
                onPressed: () {},
                icon: Image.asset('assets/img/puzzles.png'),
                iconSize: 200,
              ),
            ),
            StrokeText(
              text: '¿OBJETO GRANDE O PEQUEÑO?',
              strokeWidth: 6,
              strokeColor: Colors.red,
              textStyle: TextStyle(
                fontSize: 28,
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
      ), //aqui termina la barra de arriba de la pagina

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img/fondo.gif'),
              fit: BoxFit.cover
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StrokeText(
                  text: 'CONOCE LOS TAMAÑOS',
                  strokeWidth: 4,
                  strokeColor: Colors.red,
                  textStyle: TextStyle(
                    fontFamily: 'lazydog',
                    fontSize: 25,
                  ),
                ),
              ],
            ),

            Row(//esta refactorizado dentro de un widget
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FadeInUpBig(
                  child: AnimatedContainer(
                    width: selec ? 280: 380,
                    duration: const Duration(seconds: 3),
                    child: Image.asset('assets/img/GRANDE.png'),
                  ),
                  /*child: IconButton(
                    onPressed: () {
                     /* setState(() {
                        selec=!selec;
                      });*/
                      soundpoolgrande();
                    },
                    icon: Image.asset('assets/img/GRANDE.png'),
                    iconSize: 260,
                  ),*/
                ),
                Pulse(//pulse es para darle movimiento
                  duration: Duration(seconds: 3),
                  infinite: selec,
                child: Container(
                  width: 70.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Colors.red),
                      color: Colors.white
                  ),
                    child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: IconButton(
                        color: Colors.red,
                        iconSize: 50,
                        icon: const Icon(Icons.play_arrow),
                        onPressed: () {
                          setState(() {
                            selec=!selec;
                          });//esta setencia de setstate hace que se pare la accion al presionar el boton por primera vez
                          // do something
                          if(hola==true){//estos if van a servir para que el audio se reprodusca de acuerdo a la accion que hace el animatdcontainer de grande o pequeño
                            soundpoolgrande();
                            ban=0;
                          };
                          if(hola==false){
                            soundpoolpequeno();
                            ban=1;
                          };
                          if(ban==0){hola=false;};
                          if(ban==1){hola=true;};
                        }),
                  ),
                  ),
                ),
   /* AnimatedContainer(
      onEnd: () {
        setState(() {
          selec=!selec;
          //soundpoolpequeno();
        });
        //soundpoolgrande();
      },
    width: selec ? 100: 200,
    duration: const Duration(seconds: 5),
    child: Image.asset('assets/jabon.png'),
    ),*/
                FadeInDownBig(
                  child: AnimatedContainer(
                    width: selec ? 180: 280,
                    duration: const Duration(seconds: 3),
                    child: Image.asset('assets/img/pequeño.png'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }//fin widget
}//fin class liz


  Future<void> soundpoolgrande() async {
    Soundpool pool = Soundpool();

    int soundId = await rootBundle.load('assets/img/GRANDE.mp3').then((ByteData soundData) {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);
  }


  Future<void> soundpoolpequeno() async {
    Soundpool pool = Soundpool();

    int soundId = await rootBundle.load('assets/img/pequeño.mp3').then((ByteData soundData) {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);
  }

