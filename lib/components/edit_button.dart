import 'package:flutter/material.dart';
import 'package:patitas_a_casa/image_options.dart';

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
        showModalBottomSheet(
          context: context,
          builder: ((builder) => ImageOptions()),
        );
      },
    );
  }
}
