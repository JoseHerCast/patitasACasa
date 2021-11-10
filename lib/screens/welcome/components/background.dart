// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Nos permite obtener el tamaño del contexto (pantalla del telefono)
    //para tener un diseño responsivo
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          //Logo
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "../assets/patitas_1.png",
              width: size.width * 0.3,
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset("../assets/patitas_2.png"),
            width: size.width * 0.9,
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Image.asset("../assets/patitas_3.png"),
            width: size.width * 0.2,
          ),
          child,
        ],
      ),
    );
  }
}
