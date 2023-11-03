import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';
class rutina_diaria extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 40,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StrokeText(
              text: 'NIVELES RUTINA DIARIA',
              strokeWidth: 4,
              textStyle: TextStyle(
                fontFamily: 'lazydog',
                fontSize: 28,
              ),
            ),
            IconButton(
              onPressed: (){

              },
              icon: Image.asset('assets/img/iconobocina.gif'),
              iconSize: 60,
            ),
            SizedBox(width: 8),
            Image.asset(
              'assets/img/logo.png',
              width: 60,
              height: 60,
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
        child: ListWheelScrollView(
          itemExtent: 300,
          diameterRatio: 2.5,
          offAxisFraction: 0.5,
          perspective: 0.003,
          children: [
            Container(
              child: ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: [
                      IconButton(
                        onPressed: (){
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => nivel1_rutina_diaria()));
                        },
                        icon: Image.asset('assets/img/saturno.png'),
                        iconSize: 250,
                      ),
                      StrokeText(
                        text: 'SATURNO',
                        strokeWidth: 4,
                        strokeColor: Colors.purple,
                        textStyle: TextStyle(
                          fontFamily: 'lazydog',
                          fontSize: 38,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: [
                      IconButton(
                        onPressed: (){

                        },
                        icon: Image.asset('assets/img/flor.png'),
                        iconSize: 250,
                      ),
                      StrokeText(
                        text: 'FLOR',
                        strokeWidth: 4,
                        strokeColor: Colors.green,
                        textStyle: TextStyle(
                          fontFamily: 'lazydog',
                          fontSize: 38,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: [
                      IconButton(
                        onPressed: (){

                        },
                        icon: Image.asset('assets/img/pez.png'),
                        iconSize: 250,
                      ),
                      StrokeText(
                        text: 'PEZ',
                        strokeWidth: 4,
                        strokeColor: Colors.yellow ,
                        textStyle: TextStyle(
                          fontFamily: 'lazydog',
                          fontSize: 38,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
