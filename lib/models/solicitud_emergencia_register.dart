import 'dart:convert';

SolicitudEmergenciaPost solicitudEmergenciaPostFromMap(String str) =>
    SolicitudEmergenciaPost.fromMap(json.decode(str));

String solicitudEmergenciaPostToMap(SolicitudEmergenciaPost data) =>
    json.encode(data.toMap());

class SolicitudEmergenciaPost {
  SolicitudEmergenciaPost({
    required this.ubicacion,
    required this.tipoApoyo,
    required this.clienteId,
  });

  final String ubicacion;
  final String tipoApoyo;
  final int clienteId;

  factory SolicitudEmergenciaPost.fromMap(Map<String, dynamic> json) =>
      SolicitudEmergenciaPost(
        ubicacion: json["ubicacion"],
        tipoApoyo: json["tipo_apoyo"],
        clienteId: json["cliente_id"],
      );

  Map<String, dynamic> toMap() => {
        "ubicacion": ubicacion,
        "tipo_apoyo": tipoApoyo,
        "cliente_id": clienteId,
      };
}
