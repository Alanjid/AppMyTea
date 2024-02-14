import 'package:flutter/material.dart';

class salud_abrir_animacion extends StatelessWidget {
  const salud_abrir_animacion(  {super.key,  required this.photo, required this.onTap, required this.width, required this.heigth});

  final String photo;
  final VoidCallback onTap;
  final double width;
  final double heigth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ,
      height: heigth,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}