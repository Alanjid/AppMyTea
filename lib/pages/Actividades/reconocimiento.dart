import 'package:flutter/material.dart';

class reconocimiento extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            children: [
              Text(
                'Toñe',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20
                ),
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
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Alanid',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black
                  ),
                ),
                IconButton(
                    onPressed: (){

                    },
                    icon: Icon(
                      Icons.accessibility_new_rounded,
                      color: Colors.orange,
                    )

                ),
                Text(
                  'Esme',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  height: 200,
                    width: 200,
                    image: AssetImage(
                      'assets/img/toñe.png'
                    ),
                ),
                Image(
                  height: 200,
                  width: 200,
                  image: AssetImage(
                      'assets/img/toñe.png'
                  ),
                ),
                Image(
                  height: 200,
                  width: 200,
                  image: AssetImage(
                      'assets/img/toñe.png'
                  ),
                ),
                Image(
                  height: 200,
                  width: 200,
                  image: AssetImage(
                      'assets/img/toñe.png'
                  ),
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Column(
                  children: [
                    Image(
                      height: 100,
                      width: 100,
                      image: AssetImage(
                          'assets/img/toñe.png'
                      ),
                    ),
                    Image(
                      height: 100,
                      width: 100,
                      image: AssetImage(
                          'assets/img/toñe.png'
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Image(
                      height: 200,
                      width: 200,
                      image: AssetImage(
                          'assets/img/toñe.png'
                      ),
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
}
