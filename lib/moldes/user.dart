// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? karnet;
  String? nombre;
  String? app;
  String? apm;
  String? username;
  String? password;
  String? fecha;
  String? diagnostico;
  String? idinstitucion;
  String? isactive;

  User({
    this.karnet,
    this.nombre,
    this.app,
    this.apm,
    this.username,
    this.password,
    this.fecha,
    this.diagnostico,
    this.idinstitucion,
    this.isactive,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        karnet: json["karnet"],
        nombre: json["nombre"],
        app: json["app"],
        apm: json["apm"],
        username: json["username"],
        password: json["password"],
        fecha: json["fecha"],
        diagnostico: json["diagnostico"],
        idinstitucion: json["idinstitucion"],
        isactive: json["isactive"],
      );

  Map<String, dynamic> toJson() => {
        "karnet": karnet,
        "nombre": nombre,
        "app": app,
        "apm": apm,
        "username": username,
        "password": password,
        "fecha": fecha,
        "diagnostico": diagnostico,
        "idinstitucion": idinstitucion,
        "isactive": isactive,
      };
}
