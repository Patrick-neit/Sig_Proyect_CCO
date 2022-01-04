import 'dart:convert';

SolicitudEmergenciaList solicitudEmergenciaListFromMap(String str) =>
    SolicitudEmergenciaList.fromMap(json.decode(str));

String solicitudEmergenciaListToMap(SolicitudEmergenciaList data) =>
    json.encode(data.toMap());

class SolicitudEmergenciaList {
  SolicitudEmergenciaList({
    required this.succes,
    required this.solicitudesE,
  });

  final bool succes;
  final List<SolicitudesE> solicitudesE;

  factory SolicitudEmergenciaList.fromMap(Map<String, dynamic> json) =>
      SolicitudEmergenciaList(
        succes: json["succes"],
        solicitudesE: List<SolicitudesE>.from(
            json["solicitudes_e"].map((x) => SolicitudesE.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "succes": succes,
        "solicitudes_e": List<dynamic>.from(solicitudesE.map((x) => x.toMap())),
      };
}

class SolicitudesE {
  SolicitudesE({
    required this.id,
    required this.nombreCompleto,
    required this.ubicacion,
    required this.direccion,
    required this.tipoApoyo,
    required this.estado,
  });

  final int id;
  final String nombreCompleto;
  final String ubicacion;
  final String direccion;
  final String tipoApoyo;
  final String estado;

  factory SolicitudesE.fromMap(Map<String, dynamic> json) => SolicitudesE(
        id: json["id"],
        nombreCompleto: json["nombre_completo"],
        ubicacion: json["ubicacion"],
        direccion: json["direccion"],
        tipoApoyo: json["tipo_apoyo"],
        estado: json["estado"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre_completo": nombreCompleto,
        "ubicacion": ubicacion,
        "direccion": direccion,
        "tipo_apoyo": tipoApoyo,
        "estado": estado,
      };
}
