import 'package:flutter/material.dart';
import 'package:sig_proyect_cco/global_var.dart';
import 'package:sig_proyect_cco/models/solicitud_emergencia_register.dart';
import 'package:sig_proyect_cco/services/solicitud_emergencia_services.dart';

class TipoEmergencia extends StatefulWidget {
  const TipoEmergencia({Key? key}) : super(key: key);

  @override
  _TipoEmergenciaState createState() => _TipoEmergenciaState();
}

class _TipoEmergenciaState extends State<TipoEmergencia> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:
              Text('Servicios disponibles      ' + nombreusuarioautentificado),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('OUR SERVICES'),
              Image.asset(
                'assets/images/bomberos.jpeg',
                height: 100.0,
              ),
              _buttobomberos(),
              const SizedBox(
                height: 15.0,
              ),
              Image.asset(
                'assets/images/policia.jpeg',
                height: 100.0,
              ),
              _buttopolicia(),
              const SizedBox(
                height: 15.0,
              ),
              Image.asset(
                'assets/images/ambulancia.jpeg',
                height: 100.0,
              ),
              const SizedBox(
                height: 15.0,
              ),
              _buttomambulance(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttobomberos() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      // ignore: deprecated_member_use
      return RaisedButton(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: const Text('Solicitar Bombero'),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 10.0,
          color: Colors.redAccent,
          onPressed: () async {
            SolicitudEmergenciaPost solicitudEmergenciaPost =
                SolicitudEmergenciaPost(
                    ubicacion: ubicacioncliente,
                    tipoApoyo: tipobombero,
                    clienteId: idusuario);
            bool solicitud = await SolicitudEmergencia()
                .sendsolicitud(solicitudEmergenciaPost);

            if (solicitud) {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) => AlertDialog(
                  title: const Text('Solicitud enviada con exito'),
                  content: const Text('Ver recorrido'),
                  actions: <Widget>[
                    // ignore: deprecated_member_use
                    FlatButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, '/mylocation_maps');
                        },
                        child: const Text('Click to follow')),
                  ],

                  //backgroundColor: Colors.redAccent,
                  //shape: CircleBorder(),
                ),
              );
            } else {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) => const AlertDialog(
                    title: Text('La solicitud no pudo ser enviada'),
                    content: Text('Back')

                    //backgroundColor: Colors.redAccent,
                    //shape: CircleBorder(),
                    ),
              );
            }
          });
    });
  }
}

Widget _buttopolicia() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    // ignore: deprecated_member_use
    return RaisedButton(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: const Text('Solicitar Patrulla'),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 10.0,
        color: Colors.lightBlueAccent,
        onPressed: () async {
          SolicitudEmergenciaPost solicitudEmergenciaPost =
              SolicitudEmergenciaPost(
                  ubicacion: ubicacioncliente,
                  tipoApoyo: tipopolicia,
                  clienteId: idusuario);
          bool solicitud = await SolicitudEmergencia()
              .sendsolicitud(solicitudEmergenciaPost);

          if (solicitud) {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) => AlertDialog(
                title: const Text('Patrulla en camino'),
                content: const Text('Ver recorrido'),
                actions: <Widget>[
                  // ignore: deprecated_member_use
                  FlatButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, '/mylocation_maps');
                      },
                      child: const Text('Click to follow')),
                ],

                //backgroundColor: Colors.redAccent,
                //shape: CircleBorder(),
              ),
            );
          } else {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) => const AlertDialog(
                  title: Text('La solicitud no pudo ser enviada'),
                  content: Text('Back')

                  //backgroundColor: Colors.redAccent,
                  //shape: CircleBorder(),
                  ),
            );
          }
        });
  });
}

Widget _buttomambulance() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    // ignore: deprecated_member_use
    return RaisedButton(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: const Text('Solicitar Ambulancia'),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 10.0,
        color: Colors.yellowAccent,
        onPressed: () async {
          SolicitudEmergenciaPost solicitudEmergenciaPost =
              SolicitudEmergenciaPost(
                  ubicacion: ubicacioncliente,
                  tipoApoyo: tipoambulancia,
                  clienteId: idusuario);
          bool solicitud = await SolicitudEmergencia()
              .sendsolicitud(solicitudEmergenciaPost);

          if (solicitud) {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) => AlertDialog(
                title: const Text('Ambulancia en camino'),
                content: const Text('Ver recorrido'),
                actions: <Widget>[
                  // ignore: deprecated_member_use
                  FlatButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, '/mylocation_maps');
                      },
                      child: const Text('Click to follow')),
                ],

                //backgroundColor: Colors.redAccent,
                //shape: CircleBorder(),
              ),
            );
          } else {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) => const AlertDialog(
                  title: Text('La solicitud no pudo ser enviada'),
                  content: Text('Back')

                  //backgroundColor: Colors.redAccent,
                  //shape: CircleBorder(),
                  ),
            );
          }
        });
  });
}
