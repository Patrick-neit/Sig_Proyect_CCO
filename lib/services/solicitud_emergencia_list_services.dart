import 'package:http/http.dart' as http;
import 'package:sig_proyect_cco/models/solicituds_emergencia_list.dart';

class SolicitudesServices {
  Future<List<SolicitudesE>>? getsolicitudes() async {
    // ignore: prefer_const_declarations
    final url = 'http://127.0.0.1:8000/api/listado/solicitud_emergencia_cco';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final solicitudesresponse = solicitudEmergenciaListFromMap(response.body);
      return solicitudesresponse.solicitudesE;
    }
    return [];
  }
}
