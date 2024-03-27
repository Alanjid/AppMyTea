import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/pages/Actividades/Afectividad/amigos/act_afectividad.dart';
import 'package:untitled/pages/Actividades/Lenguaje/aprende_objetosl.dart';
import 'package:untitled/pages/Widgets/tareas_completadas.dart';

abstract class Actividad {
  String imagePath;
  bool isEnabled;
  String categoria;
  String Nombre_Actividad;
  Actividad(
      {required this.imagePath, required this.isEnabled, required this.categoria, required this.Nombre_Actividad});

  void realizarActividad(Nombre_Actividad);
}

class Afectividad extends Actividad {
  Afectividad({
    required String imagePath,
    required bool isEnabled,
    required String categoria,
    required String Nombre_Actividad
  }) : super(imagePath: imagePath, isEnabled: isEnabled, categoria: categoria, Nombre_Actividad: Nombre_Actividad);

  @override
  void realizarActividad(Nombre_Actividad) {
    if(Nombre_Actividad=='/afe_decir_hola'){
        Get.toNamed('/afe_decir_hola');
    }
    if(Nombre_Actividad=='/act1Afectividad'){
        Get.toNamed('/act1Afectividad');
    }
    if(Nombre_Actividad=='/Completadas'){
        Get.toNamed('/Completadas');
    }
    
    
  }
}

class Matematicas extends Actividad {
  Matematicas(
      {required String imagePath,
      required bool isEnabled,
      required String categoria,
      required String Nombre_Actividad})
      : super(imagePath: imagePath, isEnabled: isEnabled, categoria: categoria, Nombre_Actividad: Nombre_Actividad);

  @override
  void realizarActividad(Nombre_Actividad) {
    Get.toNamed('/Completadas');
  }
}

class Lenguaje extends Actividad {
  Lenguaje(
      {required String imagePath,
      required bool isEnabled,
      required String categoria,
      required String Nombre_Actividad})
      : super(imagePath: imagePath, isEnabled: isEnabled, categoria: categoria,Nombre_Actividad: Nombre_Actividad);

  @override
  void realizarActividad(Nombre_Actividad) {
    Get.toNamed('/act1Lenguaje');
  }
}

class HigieneySalud extends Actividad {
  HigieneySalud(
      {required String imagePath,
      required bool isEnabled,
      required String categoria,
      required String Nombre_Actividad})
      : super(imagePath: imagePath, isEnabled: isEnabled, categoria: categoria, Nombre_Actividad: Nombre_Actividad);

  @override
  void realizarActividad(Nombre_Actividad) {
    Get.toNamed('/actHigiene');
  }
}

class Movimiento extends Actividad {
  Movimiento(
      {required String imagePath,
      required bool isEnabled,
      required String categoria, 
      required String Nombre_Actividad})
      : super(imagePath: imagePath, isEnabled: isEnabled, categoria: categoria, Nombre_Actividad: Nombre_Actividad);

  @override
  void realizarActividad(Nombre_Actividad) {
    Get.toNamed('/Completadas');
  }
}

class Creatividad extends Actividad {
  Creatividad(
      {required String imagePath,
      required bool isEnabled,
      required String categoria,
      required String Nombre_Actividad})
      : super(imagePath: imagePath, isEnabled: isEnabled, categoria: categoria, Nombre_Actividad: Nombre_Actividad);

  @override
  void realizarActividad(Nombre_Actividad) {
    Get.toNamed('/Completadas');
  }
}

class ActividadFactory {
  Actividad crearActividad(String tipo, String Nombre_Actividad) {
    switch (tipo) {
      case 'Afectividad':
        return Afectividad(
            imagePath: 'assets/picto_actividades/afectividad_picto.png',
            isEnabled: true,
            categoria: 'Afectividad',
            Nombre_Actividad: Nombre_Actividad);
      case 'Matematicas':
        return Matematicas(
            imagePath: 'assets/picto_actividades/mates_picto.png',
            isEnabled: true,
            categoria: 'Matematicas',
             Nombre_Actividad: Nombre_Actividad
            );
      case 'Lenguaje':
        return Lenguaje(
            imagePath: 'assets/picto_actividades/lenguaje_picto.png',
            isEnabled: true,
            categoria: 'Lenguaje',
             Nombre_Actividad: Nombre_Actividad);
      case 'HigieneySalud':
        return HigieneySalud(
            imagePath: 'assets/picto_actividades/higine_picto.png',
            isEnabled: true,
            categoria: 'HigieneySalud',
             Nombre_Actividad: Nombre_Actividad);
      case 'Movimiento':
        return Movimiento(
            imagePath: 'assets/picto_actividades/movi_picto.png',
            isEnabled: true,
            categoria: 'Movimiento',
             Nombre_Actividad: Nombre_Actividad);
      case 'Creatividad':
        return Creatividad(
            imagePath: 'assets/picto_actividades/creatividad_picto.png',
            isEnabled: true,
            categoria: 'Creatividad',
             Nombre_Actividad: Nombre_Actividad);
      default:
        throw Exception('Tipo de actividad no soportado: $tipo');
    }
  }

  Widget crearBotonActividad(
      BuildContext context, Actividad actividad, Function(double) setVolume, String nombre_Actividad) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Visibility(
        visible: actividad.isEnabled,
        child: IconButton(
          icon: Image.asset(
            actividad.imagePath,
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          onPressed: () async {
            actividad.realizarActividad(nombre_Actividad);
            await setVolume(0);
          },
          iconSize: 120,
          padding: const EdgeInsets.all(8),
          color: Colors.blue,
        ),
      ),
    );
  }
}
