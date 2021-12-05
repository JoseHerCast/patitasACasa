import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mi_app_final/patitas_a_casa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Barra de notificaciones transparente
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    //Descripción dummy de muestra

    return MaterialApp(
      title: 'Patitas a casa',
      home: Scaffold(
        //Apilamos un listview con la descripción y el header con las imagenes de perritos
        body: PatitasACasa(),
      ),
    );
  }
}
