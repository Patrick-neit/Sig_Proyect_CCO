import 'package:flutter/material.dart';
import 'package:sig_proyect_cco/models/tipoapoyo_register.dart';
import 'package:sig_proyect_cco/services/tipoapoyo_services.dart';

class TipoApoyoRegisterView extends StatefulWidget {
  const TipoApoyoRegisterView({Key? key}) : super(key: key);

  @override
  _TipoApoyoRegisterViewState createState() => _TipoApoyoRegisterViewState();
}

class _TipoApoyoRegisterViewState extends State<TipoApoyoRegisterView> {
  TextEditingController controllernombre = TextEditingController();
  TextEditingController controllercorreo = TextEditingController();
  TextEditingController controllerespecialidad = TextEditingController();
  TextEditingController controllergrupo = TextEditingController();
  TextEditingController controllercargo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Registrarse en la App Tipo Apoyo'),
        ),
        body: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50.0,
                        ),
                        const Text('Ingrese sus datos!'),
                        const SizedBox(
                          height: 20.0,
                        ),
                        _nametextfield(),
                        const SizedBox(
                          height: 15.0,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        _correotextfield(),
                        const SizedBox(
                          height: 15.0,
                        ),
                        _especialidadtextfield(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        _grupotextfield(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        _cargotextfield(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        _bottomSubmit(),
                        const SizedBox(
                          height: 15.0,
                        ),
                      ],
                    )))
          ],
        ),
      ),
    );
  }

  Widget _nametextfield() {
    return StreamBuilder(
        // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
        builder: (BuildContext context, AsyncSnapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
          controller: controllernombre,
          decoration: const InputDecoration(
            icon: Icon(Icons.verified_user),
            //hintText: 'ejemplo@gmail.com',
            labelText: 'UserName',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _correotextfield() {
    return StreamBuilder(
        // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
        builder: (BuildContext context, AsyncSnapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
          controller: controllercorreo,
          decoration: const InputDecoration(
            icon: Icon(Icons.mail_rounded),
            labelText: 'Email',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _especialidadtextfield() {
    return StreamBuilder(
        // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
        builder: (BuildContext context, AsyncSnapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
          controller: controllerespecialidad,
          decoration: const InputDecoration(
            icon: Icon(Icons.folder_special),
            labelText: 'Especialidad',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _grupotextfield() {
    return StreamBuilder(
        // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
        builder: (BuildContext context, AsyncSnapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
          controller: controllergrupo,
          decoration: const InputDecoration(
            icon: Icon(Icons.group_add_rounded),
            //hintText: '***',
            labelText: 'Your Group',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _cargotextfield() {
    return StreamBuilder(
        // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
        builder: (BuildContext context, AsyncSnapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
          controller: controllercargo,
          decoration: const InputDecoration(
            icon: Icon(Icons.charging_station_sharp),
            //hintText: '***',
            labelText: 'Cargo',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _bottomSubmit() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      // ignore: deprecated_member_use
      return RaisedButton(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: const Text('Submit'),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 10.0,
          color: Colors.greenAccent,
          onPressed: () async {
            TipoApoyoRegister tipoApoyoRegister = TipoApoyoRegister(
                nombre: controllernombre.text,
                correo: controllercorreo.text,
                especialidad: controllerespecialidad.text,
                grupo: controllergrupo.text,
                cargo: controllercargo.text);

            bool apoyoregister =
                await TipoApoyoServices().registrartipoapoyo(tipoApoyoRegister);
            if (apoyoregister) {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) => AlertDialog(
                  title: const Text('Registrado Con exito'),
                  content: const Text('Back'),
                  actions: <Widget>[
                    // ignore: deprecated_member_use
                    FlatButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, '/login_page');
                        },
                        child: const Text('Go')),
                  ],
                ),
              );
            } else {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) => const AlertDialog(
                    title: Text('Re-check your inf'), content: Text('Back')),
              );
            }
          });
    });
  }
}
