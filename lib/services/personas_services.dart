import 'package:http/http.dart' as http;
import 'package:sig_proyect_cco/models/personas_register.dart';

class PersonasRegisterService {
  Future<bool> personasregister(RegisterUser registerUser) async {
    const url = 'http://127.0.0.1:8000/api/registrar-usuario';
    var per = registerUserToMap(registerUser);
    final response = await http.post(
      Uri.parse(url),
      body: per,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      // ignore: avoid_print

      // ignore: avoid_print
      print(per);
      return true;
    } else {
      return false;
    }
  }
}
