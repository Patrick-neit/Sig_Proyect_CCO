import 'package:http/http.dart' as http;
import 'package:sig_proyect_cco/models/asignar_solicitud_register.dart';

class AsignarApoyoServices {
  Future<bool> asignarapoyo(
      ApoyoSolicitudEmergencia apoyoSolicitudEmergencia) async {
    const url = 'http://127.0.0.1:8000/api/assign_emergency_support';
    var log = apoyoSolicitudEmergenciaToMap(apoyoSolicitudEmergencia);
    final response = await http.post(
      Uri.parse(url),
      body: log,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(log);
      return true;
    } else {
      return false;
    }
  }
}
