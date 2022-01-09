import 'package:http/http.dart' as http;
import 'package:sig_proyect_cco/models/tipoapoyo_register.dart';

class TipoApoyoServices {
  Future<bool> registrartipoapoyo(TipoApoyoRegister tipoApoyoRegister) async {
    const url = 'http://127.0.0.1:8000/api/registrar_tipos_apoyo';
    var log = tipoApoyoRegisterToMap(tipoApoyoRegister);
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
