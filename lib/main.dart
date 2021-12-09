import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'patitas_a_casa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Barra de notificaciones transparente
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    //Descripción dummy de muestra

    return const MaterialApp(
      title: 'Patitas a casa',
      home: Scaffold(
        //Apilamos un listview con la descripción y el header con las imagenes de perritos
        body: PatitasACasa(),
      ),
    );
  }
}
