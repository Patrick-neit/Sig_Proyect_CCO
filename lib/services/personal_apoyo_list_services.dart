import 'package:http/http.dart' as http;
import 'package:sig_proyect_cco/models/personal_apoyo_register.dart';

class PersonalApoyoService {
  Future<List<Listadopersonal>>? getlistadopersonal() async {
    // ignore: prefer_const_declarations
    final url = 'http://127.0.0.1:8000/api/listado/personal_apoyo';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final personalresponse = personalApoyoListFromMap(response.body);
      return personalresponse.listadopersonal;
    }
    return [];
  }
}
