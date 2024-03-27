import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:soundpool/soundpool.dart';


import '../../../Widgets/salud_abrir_animacion.dart';
class nos_saludamos extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width:50.0,
              height: 50.0,
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2,color: Colors.orange),
                  color: Colors.white
              ),
              child: IconButton(
                onPressed: (){
                },
                icon: Image.asset('assets/img/niños_nivel_pony.png'),
                iconSize: 200,
              ),
            ),
            StrokeText(
              text: 'NOS SALUDAMOS CUANDO LLEGAMOS',
              strokeWidth: 6,
              strokeColor: Colors.orange,
              textStyle: TextStyle(
                fontSize: 28,
                fontFamily: 'lazydog',
              ),
            ),
            IconButton(
              onPressed: (){

              },
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
              image: AssetImage('assets/img/fondo.gif'),
              fit: BoxFit.cover
          ),
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
                Image(
                  image: AssetImage(
                      'assets/img/niños_nivel_pony.png'
                  ),
                  width: 320,
                  height: 300,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        StrokeText(
                          text: 'CHOCA LOS 5',
                          strokeColor: Colors.orange,
                          strokeWidth: 6,
                          textStyle: TextStyle(
                            fontFamily: 'lazydog',
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(
                          width: 95,
                        ),
                        StrokeText(
                          text: 'DECIR HOLA',
                          strokeColor: Colors.orange,
                          strokeWidth: 6,
                          textStyle: TextStyle(
                            fontFamily: 'lazydog',
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Boton choca los 5
                        Container(//imagen chica 1
                          width:120.0,
                          height: 120.0,
                          padding: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(width: 4,color: Colors.orange),
                              color: Colors.white
                          ),
                          child: salud_abrir_animacion(
                            photo: 'assets/img/chocas5.png',
                            width: 600.0,
                            heigth: 200,
                            onTap: () {//esto son las acciones que hará cuando se de click en la imagen
                              soundpool2();
                              Navigator.of(context).push(MaterialPageRoute<void>(
                                  builder: (BuildContext context) {
                                    return Scaffold(
                                      appBar: AppBar(
                                        title: const Text('NOS SALUDAMOS CUANDO LLEGAMOS'),
                                      ),
                                      body: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(width: 4,color: Colors.orange),
                                            color: Colors.white
                                        ),
                                        padding: const EdgeInsets.all(0),
                                        alignment: Alignment.center,
                                        child: salud_abrir_animacion(
                                          photo: 'assets/img/gifchoca5.gif',
                                          width: 500.0,
                                          heigth: 600,
                                          onTap: () {
                                            Navigator.of(context).pop();//hace que regrese a la ultima ventana
                                          },
                                        ),
                                      ),
                                    );
                                  }
                              ));
                            },
                          ),
                        ),
                        SizedBox(
                          width: 90,
                        ),
                        //Boton Matemáticas
                        Container(//imagen chica 1
                          width:120.0,
                          height: 120.0,
                          padding: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 4,color: Colors.orange),
                              color: Colors.white
                          ),
                          child: salud_abrir_animacion(
                            photo: 'assets/img/holaa.png',
                            width: 400.0,
                            heigth: 600,
                            onTap: () {//esto son las acciones que hará cuando se de click en la imagen
                              soundpool3();
                              Navigator.of(context).push(MaterialPageRoute<void>(
                                  builder: (BuildContext context) {
                                    return Scaffold(
                                      appBar: AppBar(
                                        title: const Text('NOS SALUDAMOS CUANDO LLEGAMOS'),
                                      ),
                                      body: Container(

                                        decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(width: 4,color: Colors.orange),
                                            color: Colors.white
                                        ),
                                        padding: const EdgeInsets.all(0),
                                        alignment: Alignment.center,
                                        child: salud_abrir_animacion(
                                          photo: 'assets/img/gif_saludar.gif',
                                          width: 500.0,
                                          heigth: 600,
                                          onTap: () {
                                            Navigator.of(context).pop();//hace que regrese a la ultima ventana
                                          },
                                        ),
                                      ),
                                    );
                                  }
                              ));
                            },
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        StrokeText(
                          text: 'ABRAZAR',
                          strokeColor: Colors.orange,
                          strokeWidth: 5,
                          textStyle: TextStyle(
                            fontFamily: 'lazydog',
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        StrokeText(
                          text: 'CHOCA PUÑOS',
                          strokeColor: Colors.orange,
                          strokeWidth: 6,
                          textStyle: TextStyle(
                            fontFamily: 'lazydog',
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //Boton abrazar
                        Container(//imagen chica 1
                          width:120.0,
                          height: 120.0,
                          padding: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 4,color: Colors.orange),
                              color: Colors.white
                          ),
                          child: salud_abrir_animacion(
                            photo: 'assets/img/abraz.png',
                            width: 400.0,
                            heigth: 600,
                            onTap: () {//esto son las acciones que hará cuando se de click en la imagen
                              soundpool();
                              Navigator.of(context).push(MaterialPageRoute<void>(
                                  builder: (BuildContext context) {
                                    return Scaffold(
                                      appBar: AppBar(
                                        title: const Text('NOS SALUDAMOS CUANDO LLEGAMOS'),
                                      ),
                                      body: Container(

                                        decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(width: 4,color: Colors.orange),
                                            color: Colors.white
                                        ),
                                        padding: const EdgeInsets.all(0),
                                        alignment: Alignment.center,
                                        child: salud_abrir_animacion(
                                          photo: 'assets/img/gifabrazo.gif',
                                          width: 500.0,
                                          heigth: 600,
                                          onTap: () {
                                            Navigator.of(context).pop();//hace que regrese a la ultima ventana
                                          },
                                        ),
                                      ),
                                    );
                                  }
                              ));
                            },
                          ),
                        ),
                        SizedBox(
                          width: 90,
                        ),
                        //Boton Matemáticas
                        Container(//imagen chica 1
                          width:120.0,
                          height: 120.0,
                          padding: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 4,color: Colors.orange),
                              color: Colors.white
                          ),
                          child: salud_abrir_animacion(
                            photo: 'assets/img/chok5.png',
                            width: 400.0,
                            heigth: 600,
                            onTap: () {//esto son las acciones que hará cuando se de click en la imagen
                              soundpool4();
                              Navigator.of(context).push(MaterialPageRoute<void>(
                                  builder: (BuildContext context) {
                                    return Scaffold(
                                      appBar: AppBar(
                                        title: const Text('NOS SALUDAMOS CUANDO LLEGAMOS'),
                                      ),
                                      body: Container(

                                        decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(width: 4,color: Colors.orange),
                                            color: Colors.white
                                        ),
                                        padding: const EdgeInsets.all(0),
                                        alignment: Alignment.center,
                                        child: salud_abrir_animacion(
                                          photo: 'assets/img/gifchocapuños.gif',
                                          width: 500.0,
                                          heigth: 600,
                                          onTap: () {
                                            Navigator.of(context).pop();//hace que regrese a la ultima ventana
                                          },
                                        ),
                                      ),
                                    );
                                  }
                              ));
                            },
                          ),
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
    );
  }

  Future<void> soundpool() async{
    Soundpool pool = Soundpool();
    int soundId = await rootBundle.load('assets/img/abrazar.mp3').then((ByteData soundData) {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);
  }
  Future<void> soundpool2() async{
    Soundpool pool = Soundpool();
    int soundId = await rootBundle.load('assets/img/choca5.mp3').then((ByteData soundData) {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);
  }
  Future<void> soundpool3() async{
    Soundpool pool = Soundpool();
    int soundId = await rootBundle.load('assets/img/audio_hola.mp3').then((ByteData soundData) {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);
  }
  Future<void> soundpool4() async{
    Soundpool pool = Soundpool();
    int soundId = await rootBundle.load('assets/img/choquepuños.mp3').then((ByteData soundData) {
      return pool.load(soundData);
    });
    int streamId = await pool.play(soundId);
  }
}
