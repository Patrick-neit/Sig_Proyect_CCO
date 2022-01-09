import 'package:flutter/material.dart';
import 'package:sig_proyect_cco/emergency_type_page.dart';
import 'package:sig_proyect_cco/listado_solicitudes_emergencia.dart';
import 'package:sig_proyect_cco/locations/mylocation_maps.dart';
import 'package:sig_proyect_cco/login_page.dart';
import 'package:sig_proyect_cco/personal_apoyoview.dart';
import 'package:sig_proyect_cco/register_user_page.dart';
import 'package:sig_proyect_cco/tipoapoyo_view.dart';

void main() {
  runApp(const SigApp());
}

class SigApp extends StatelessWidget {
  const SigApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SIG|MAPS',
      home: const SigLoginPage(),
      routes: <String, WidgetBuilder>{
        '/loginpage': (BuildContext context) => const SigLoginPage(),
        '/register_user_page': (BuildContext context) =>
            const RegisterUserPage(),
        '/emergency_type_page': (BuildContext context) =>
            const TipoEmergencia(),
        '/login_page': (BuildContext context) => const LoginPage(),
        '/mylocation_maps': (BuildContext context) => const MyLocation(),
        '/listado_solicitudes_emergencia': (BuildContext context) =>
            const SolicitudEmergenciaListPage(),
        '/personal_apoyoview': (BuildContext context) =>
            const ListadoPersonalView(),
        '/tipoapoyo_view': (BuildContext context) =>
            const TipoApoyoRegisterView(),
      },
    );
  }
}

class SigLoginPage extends StatefulWidget {
  const SigLoginPage({Key? key}) : super(key: key);

  @override
  _SigLoginState createState() => _SigLoginState();
}

class _SigLoginState extends State<SigLoginPage> {
  TextEditingController controllerId = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('WELLCOME TO OUR CCO CENTER'),
              const SizedBox(
                height: 25,
              ),
              Flexible(
                child: Image.asset(
                  'assets/images/ccofirstview.jpg',
                  height: 200.0,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              _bottomRegister(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomRegister() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      // ignore: deprecated_member_use
      return RaisedButton(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: const Text('Registrate'),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 10.0,
          color: Colors.lightBlueAccent,
          onPressed: () {
            //Aqui tenemos q llamar a la funcion login
            Navigator.pushReplacementNamed(context, '/login_page');
            // Login();
          });
    });
  }
}
