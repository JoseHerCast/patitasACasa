import 'package:flutter/material.dart';

class EditButton extends StatefulWidget {
  const EditButton({Key? key}) : super(key: key);

  @override
  //Estado
  _EditButtonState createState() => _EditButtonState();
}

//Acciones
class _EditButtonState extends State<EditButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      //Estilo del boton
      backgroundColor: Colors.orange.withAlpha(150),
      mini: true,
      tooltip: "Editar",
      child: const Icon(
        Icons.create,
        size: 20,
        color: Colors.white,
      ),
      //Funcionalidad
      onPressed: () {
        //Muestra una breve snackbar con un mensaje (solo para prueba de funcionamiento)
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Cambio de imagen de perfil"),
          ),
        );
      },
    );
  }
}
