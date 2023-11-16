import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/pages/home/principal.dart';
import 'package:untitled/pages/home/saludo_inicio.dart';
import '../Widgets/Objetivos.dart';
import 'pantalla_de_carga.dart';
import 'package:untitled/utils/colors.dart' as utils;
class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}
class MyHomePageState extends State<MyHomePage>{
  bool isLoading = true;
  bool _isPasswordVisible = true;

  final passwordController= TextEditingController();
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0), () {
      setState(() {
        isLoading = false;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
    return isLoading
        ? Pantalla_de_Carga()
        : Scaffold(

      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
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
              // Aquí agregas el contenido del contenedor
              child: Column(
                children: [
                  const SizedBox(
                    width: 350,
                    height: 250,
                    child:Image(
                        width: 100,
                        height: 100,
                        image: AssetImage(
                            "assets/img/logo.png"
                        )
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child:ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          onPressed: (){
                            showDialog(
                                context: context,
                                builder: (BuildContext context){
                                  return SingleChildScrollView(
                                    child: Dialog(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.white.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: const Offset(0, 3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        alignment: Alignment.center,
                                        height: 300,
                                        width: 450,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            const SizedBox(
                                              height: 50,
                                              width: 50,
                                              child: Image(
                                                image: AssetImage(
                                                    "assets/img/logo.png"
                                                ),
                                              ),
                                            ),
                                            const Text(
                                              "INICIO DE SESIÓN",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            const SizedBox(
                                              width: 300,
                                              height: 80,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                    ),
                                                    label: Text(
                                                        "Ingresa el usuario"
                                                    ),
                                                    icon: Icon(
                                                      size: 20,
                                                      Icons.account_circle,
                                                      color: utils.Colors.azulitoArriba,
                                                    ),
                                                    hintText: "Ingresa el usuario"
                                                ),

                                              ),
                                            ),
                                            SizedBox(
                                              width: 300,
                                              height: 80,
                                              child: TextField(
                                                obscureText: _isPasswordVisible,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  labelText: "Ingresa la contraseña",
                                                  icon: Icon(
                                                    Icons.lock_rounded,
                                                    color: utils.Colors.azulitoArriba,
                                                  ),
                                                  errorText: "Debe contener letras, números y un símbolo",
                                                  errorStyle: TextStyle(
                                                    color: Colors.red,
                                                  ),
                                                  hintText: "Ingresa la contraseña",
                                                  suffixIcon: IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        _isPasswordVisible = !_isPasswordVisible;
                                                      });
                                                    },
                                                    icon: _isPasswordVisible
                                                        ? Icon(Icons.visibility)
                                                        : Icon(Icons.visibility_off),
                                                    color: utils.Colors.azulitoArriba,
                                                  ),
                                                ),
                                              ),

                                            ),
                                            MaterialButton(
                                              color: utils.Colors.azulitoArriba,
                                              height: 50,
                                              child: const Text(
                                                "INICIAR SESIÓN",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white
                                                ),
                                              ),
                                              onPressed: (){
                                                AwesomeDialog(
                                                  context: context,
                                                  dialogType: DialogType.info,
                                                  animType: AnimType.scale,
                                                  showCloseIcon: true,
                                                  title: "Inicio Sesion",
                                                  desc: "¿Quiere mantener la sesion iniciada?",
                                                  btnCancelOnPress: (){

                                                  },
                                                  btnOkOnPress: (){
                                                    AwesomeDialog(
                                                        context: context,
                                                        dialogType: DialogType.success,
                                                        animType: AnimType.scale,
                                                        showCloseIcon: true,
                                                        title: "",
                                                        desc: "Inicio de sesion correcto",
                                                        btnOkOnPress: (){
                                                         Navigator.push(context, MaterialPageRoute(builder: (context) => principal()));
                                                          //Navigator.push(context, MaterialPageRoute(builder: (context) => Objetivos(Objetivo: "que el niño trabaje la afectividad por medio de los pictogramas mostrados", Instrucciones: "HAcer tarea aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", Materiales: "lapiz y papel, goma, pelotas, sacapuntas, y otras cosillas", imagenes: ["assets/img/tijeras_real.png","assets/img/silla_real.png","assets/img/platanos.png","assets/img/pelotar.png"])));
                                                        }
                                                    ).show();
                                                  },
                                                ).show();
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                            );
                          },
                          icon: Image.asset('assets/img/botonstart.png'),
                          iconSize: 60,
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

}