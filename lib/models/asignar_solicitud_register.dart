import 'dart:convert';

ApoyoSolicitudEmergencia apoyoSolicitudEmergenciaFromMap(String str) =>
    ApoyoSolicitudEmergencia.fromMap(json.decode(str));

String apoyoSolicitudEmergenciaToMap(ApoyoSolicitudEmergencia data) =>
    json.encode(data.toMap());

class ApoyoSolicitudEmergencia {
  ApoyoSolicitudEmergencia({
    required this.ubicacion,
    required this.tipoApoyo,
    required this.clienteId,
    required this.personalCcoId,
    required this.personalApoyoId,
  });

  final String ubicacion;
  final String tipoApoyo;
  final int clienteId;
  final int personalCcoId;
  final int personalApoyoId;

  factory ApoyoSolicitudEmergencia.fromMap(Map<String, dynamic> json) =>
      ApoyoSolicitudEmergencia(
        ubicacion: json["ubicacion"],
        tipoApoyo: json["tipo_apoyo"],
        clienteId: json["cliente_id"],
        personalCcoId: json["personal_cco_id"],
        personalApoyoId: json["personal_apoyo_id"],
      );

  Map<String, dynamic> toMap() => {
        "ubicacion": ubicacion,
        "tipo_apoyo": tipoApoyo,
        "cliente_id": clienteId,
        "personal_cco_id": personalCcoId,
        "personal_apoyo_id": personalApoyoId,
      };
}
