import 'dart:convert';

PersonalApoyoList personalApoyoListFromMap(String str) =>
    PersonalApoyoList.fromMap(json.decode(str));

String personalApoyoListToMap(PersonalApoyoList data) =>
    json.encode(data.toMap());

class PersonalApoyoList {
  PersonalApoyoList({
    required this.success,
    required this.listadopersonal,
  });

  final bool success;
  final List<Listadopersonal> listadopersonal;

  factory PersonalApoyoList.fromMap(Map<String, dynamic> json) =>
      PersonalApoyoList(
        success: json["success"],
        listadopersonal: List<Listadopersonal>.from(
            json["listadopersonal"].map((x) => Listadopersonal.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "listadopersonal":
            List<dynamic>.from(listadopersonal.map((x) => x.toMap())),
      };
}

class Listadopersonal {
  Listadopersonal({
    required this.id,
    required this.nombreCompleto,
    required this.tipoApoyoId,
    required this.nombre,
    required this.vehiculoId,
    required this.celular,
  });

  final int id;
  final String nombreCompleto;
  final int tipoApoyoId;
  final String nombre;
  final int? vehiculoId;
  final String celular;

  factory Listadopersonal.fromMap(Map<String, dynamic> json) => Listadopersonal(
        id: json["id"],
        nombreCompleto: json["nombre_completo"],
        tipoApoyoId: json["tipo_apoyo_id"],
        nombre: json["nombre"],
        vehiculoId: json["vehiculo_id"],
        celular: json["celular"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre_completo": nombreCompleto,
        "tipo_apoyo_id": tipoApoyoId,
        "nombre": nombre,
        "vehiculo_id": vehiculoId,
        "celular": celular,
      };
}
