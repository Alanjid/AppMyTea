// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled/pages/home/saludo/saludo_inicio.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? password;
  String? fecha_nacimiento;
  String? username;
  String? first_name;
  String? last_name;
  String? email;
  String? karnet;
  String? diagnostico;
  String? sessionToken;

  User({
    this.password,
    this.fecha_nacimiento,
    this.username,
    this.first_name,
    this.last_name,
    this.email,
    this.karnet,
    this.diagnostico,
    this.sessionToken,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        password: json["password"],
        username: json["username"],
        first_name: json["first_name"],
        last_name: json["last_name"],
        email: json["email"],
        karnet: json["karnet"],
        diagnostico: json["diagnostico"],
        sessionToken: json["session_token"],
      );

  Map<String, dynamic> toJson() => {
        "password":password,
        "username":username,
        "first_name":first_name,
        "last_name": last_name,
        "email": email,
        "karnet": karnet,
        "diagnostico": diagnostico,
        "session_token": sessionToken,
      };
}
