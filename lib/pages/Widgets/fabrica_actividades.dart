import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/pages/Actividades/Afectividad/amigos/act_afectividad.dart';
import 'package:untitled/pages/Actividades/Lenguaje/aprende_objetosl.dart';
import 'package:untitled/pages/Widgets/tareas_completadas.dart';

abstract class Actividad {
  String imagePath;
  bool isEnabled;
  String nombre;

  Actividad(
      {required this.imagePath, required this.isEnabled, required this.nombre});

  void realizarActividad();
}

class Afectividad extends Actividad {
  Afectividad({
    required String imagePath,
    required bool isEnabled,
    required String nombre,
  }) : super(imagePath: imagePath, isEnabled: isEnabled, nombre: nombre);

  @override
  void realizarActividad() {
    Get.toNamed('/afe_decir_hola');
  }
}

class Matematicas extends Actividad {
  Matematicas(
      {required String imagePath,
      required bool isEnabled,
      required String nombre})
      : super(imagePath: imagePath, isEnabled: isEnabled, nombre: nombre);

  @override
  void realizarActividad() {
    Get.toNamed('/Completadas');
  }
}

class Lenguaje extends Actividad {
  Lenguaje(
      {required String imagePath,
      required bool isEnabled,
      required String nombre})
      : super(imagePath: imagePath, isEnabled: isEnabled, nombre: nombre);

  @override
  void realizarActividad() {
    Get.toNamed('/act1Lenguaje');
  }
}

class HigieneySalud extends Actividad {
  HigieneySalud(
      {required String imagePath,
      required bool isEnabled,
      required String nombre})
      : super(imagePath: imagePath, isEnabled: isEnabled, nombre: nombre);

  @override
  void realizarActividad() {
    Get.toNamed('/actHigiene');
  }
}

class Movimiento extends Actividad {
  Movimiento(
      {required String imagePath,
      required bool isEnabled,
      required String nombre})
      : super(imagePath: imagePath, isEnabled: isEnabled, nombre: nombre);

  @override
  void realizarActividad() {
    Get.toNamed('/Completadas');
  }
}

class Creatividad extends Actividad {
  Creatividad(
      {required String imagePath,
      required bool isEnabled,
      required String nombre})
      : super(imagePath: imagePath, isEnabled: isEnabled, nombre: nombre);

  @override
  void realizarActividad() {
    Get.toNamed('/Completadas');
  }
}

class ActividadFactory {
  Actividad crearActividad(String tipo) {
    switch (tipo) {
      case 'Afectividad':
        return Afectividad(
            imagePath: 'assets/picto_actividades/afectividad_picto.png',
            isEnabled: true,
            nombre: 'Afectividad');
      case 'Matematicas':
        return Matematicas(
            imagePath: 'assets/picto_actividades/mates_picto.png',
            isEnabled: true,
            nombre: 'Matematicas');
      case 'Lenguaje':
        return Lenguaje(
            imagePath: 'assets/picto_actividades/lenguaje_picto.png',
            isEnabled: true,
            nombre: 'Lenguaje');
      case 'HigieneySalud':
        return HigieneySalud(
            imagePath: 'assets/picto_actividades/higine_picto.png',
            isEnabled: true,
            nombre: 'HigieneySalud');
      case 'Movimiento':
        return Movimiento(
            imagePath: 'assets/picto_actividades/movi_picto.png',
            isEnabled: true,
            nombre: 'Movimiento');
      case 'Creatividad':
        return Creatividad(
            imagePath: 'assets/picto_actividades/creatividad_picto.png',
            isEnabled: true,
            nombre: 'Creatividad');
      default:
        throw Exception('Tipo de actividad no soportado: $tipo');
    }
  }

  Widget crearBotonActividad(
      BuildContext context, Actividad actividad, Function(double) setVolume) {
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
            actividad.realizarActividad();
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
