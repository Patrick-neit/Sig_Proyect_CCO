import 'dart:convert';

TipoApoyoRegister tipoApoyoRegisterFromMap(String str) =>
    TipoApoyoRegister.fromMap(json.decode(str));

String tipoApoyoRegisterToMap(TipoApoyoRegister data) =>
    json.encode(data.toMap());

class TipoApoyoRegister {
  TipoApoyoRegister({
    required this.nombre,
    required this.correo,
    required this.especialidad,
    required this.grupo,
    required this.cargo,
  });

  final String nombre;
  final String correo;
  final String especialidad;
  final String grupo;
  final String cargo;

  factory TipoApoyoRegister.fromMap(Map<String, dynamic> json) =>
      TipoApoyoRegister(
        nombre: json["nombre"],
        correo: json["correo"],
        especialidad: json["especialidad"],
        grupo: json["grupo"],
        cargo: json["cargo"],
      );

  Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "correo": correo,
        "especialidad": especialidad,
        "grupo": grupo,
        "cargo": cargo,
      };
}
