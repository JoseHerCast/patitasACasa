import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertButton extends StatelessWidget {
  //Texto del boton
  String buttonText = "Alerta";

  AlertButton(this.buttonText);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //Acción a ejecutar en caso de tap
      onTap: () {
        //Muestra una breve snackbar con un mensaje (solo para prueba de funcionamiento)
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Alerta enviada"),
          ),
        );
      },
      //Boton
      child: Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        height: 50,
        width: 180,
        //Estilo del boton
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          gradient: LinearGradient(
            colors: [
              Colors.green,
              Colors.lightGreen,
            ],
            begin: FractionalOffset(0.2, 0.0),
            end: FractionalOffset(1, 0.6),
            stops: [0, 0.6],
            tileMode: TileMode.clamp,
          ),
        ),
        //Texto del boton
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 20,
              fontFamily: "Lato-Regular",
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
