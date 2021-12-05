import 'package:flutter/material.dart';

class ShareButton extends StatefulWidget {
  ShareButton({Key? key}) : super(key: key);

  @override
  //Estado
  _ShareButtonState createState() => _ShareButtonState();
}

//Acciones
class _ShareButtonState extends State<ShareButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      //Estilo del boton
      backgroundColor: Colors.grey.withAlpha(150),
      mini: true,
      tooltip: "Compartir",
      child: Icon(
        Icons.share,
        color: Colors.white,
      ),
      //Funcionalidad
      onPressed: () {
        //Muestra una breve snackbar con un mensaje (solo para prueba de funcionamiento)
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Compartiendo..."),
          ),
        );
      },
    );
  }
}
