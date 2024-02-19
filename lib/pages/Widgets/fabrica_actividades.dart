import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/pages/Actividades/Afectividad/act_afectividad.dart';
import 'package:untitled/pages/Actividades/Higiene/h1_ba%C3%B1o/aprende_poy_real.dart';
import 'package:untitled/pages/Actividades/Higiene/n1_rd_salud_pt2.dart';
import 'package:untitled/pages/Widgets/tareas_completadas.dart';

abstract class Actividad {
  String imagePath;
  bool isEnabled;
  String nombre;

  Actividad(
      {required this.imagePath, required this.isEnabled, required this.nombre});

  void realizarActividad();
}

class Alimento extends Actividad {
  Alimento({
    required String imagePath,
    required bool isEnabled,
    required String nombre,
  }) : super(imagePath: imagePath, isEnabled: isEnabled, nombre: nombre);

  @override
  void realizarActividad() {
    Get.to(afectividad_realista());
  }
}

class Bebidas extends Actividad {
  Bebidas(
      {required String imagePath,
      required bool isEnabled,
      required String nombre})
      : super(imagePath: imagePath, isEnabled: isEnabled, nombre: nombre);

  @override
  void realizarActividad() {
    Get.to(tareas_comp_diarias());
  }
}

class Acciones extends Actividad {
  Acciones(
      {required String imagePath,
      required bool isEnabled,
      required String nombre})
      : super(imagePath: imagePath, isEnabled: isEnabled, nombre: nombre);

  @override
  void realizarActividad() {
    Get.to(apren_pony_lenguaje_real());
  }
}

class PartesDelCuerpo extends Actividad {
  PartesDelCuerpo(
      {required String imagePath,
      required bool isEnabled,
      required String nombre})
      : super(imagePath: imagePath, isEnabled: isEnabled, nombre: nombre);

  @override
  void realizarActividad() {
    Get.to(n1_rd_salu());
  }
}

class Prendas extends Actividad {
  Prendas(
      {required String imagePath,
      required bool isEnabled,
      required String nombre})
      : super(imagePath: imagePath, isEnabled: isEnabled, nombre: nombre);

  @override
  void realizarActividad() {
    Get.to(tareas_comp_diarias());
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
    Get.to(tareas_comp_diarias());
  }
}
class ActividadFactory {
  Actividad crearActividad(String tipo) {
    switch (tipo) {
      case 'Alimento':
        return Alimento(
            imagePath: 'assets/img/alimento.png',
            isEnabled: true,
            nombre: 'Alimentos');
      case 'Bebidas':
        return Bebidas(
            imagePath: 'assets/img/bebidas.png',
            isEnabled: true,
            nombre: 'Bebidas');
      case 'Acciones':
        return Acciones(
            imagePath: 'assets/img/acciones.png',
            isEnabled: true,
            nombre: 'Acciones');
      case 'PartesDelCuerpo':
        return PartesDelCuerpo(
            imagePath: 'assets/img/partes del cuerpo.png',
            isEnabled: true,
            nombre: 'Partes del cuerpo');
      case 'Prendas':
        return Prendas(
            imagePath: 'assets/img/prendas.png',
            isEnabled: true,
            nombre: 'Prendas de vestir');
      case 'Matematicas':
        return Matematicas(
            imagePath: 'assets/img/matemáticas.png',
            isEnabled: true,
            nombre: 'Matemàticas');
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
