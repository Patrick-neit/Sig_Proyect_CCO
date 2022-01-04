import 'package:http/http.dart' as http;

import 'package:sig_proyect_cco/models/solicitud_emergencia_register.dart';

class SolicitudEmergencia {
  Future<bool> sendsolicitud(
      SolicitudEmergenciaPost solicitudEmergenciaPost) async {
    const url = 'http://127.0.0.1:8000/api/send/solicitud_emergencia';
    var solicitud = solicitudEmergenciaPostToMap(solicitudEmergenciaPost);
    final response = await http.post(
      Uri.parse(url),
      body: solicitud,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(solicitud); //omla
      return true;
    } else {
      return false;
    }
  }
}
