import 'package:flutter/material.dart';
import 'components/alert_button.dart';

class DescriptionPage extends StatelessWidget {
  //Nombre del perrito, ubicación y descripción
  final String dogName;
  final String placeName;
  final String description;

  const DescriptionPage(this.dogName, this.placeName, this.description,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Contenedor de descripción
    final descriptionBox = Container(
      margin: const EdgeInsets.only(
        top: 30,
        bottom: 40,
        right: 30,
        left: 30,
      ),
      //Texto de descripción
      child: Text(
        description,
        style: const TextStyle(
          fontFamily: "Lato-Regular",
          fontSize: 15,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
    //Último lugar en que se vió
    final lastView = Row(
      children: [
        //Icono de lugar
        Container(
          margin: const EdgeInsets.only(top: 320, left: 10),
          child: const Icon(
            Icons.place,
            color: Colors.grey,
          ),
        ),
        //Nombre del lugar
        Container(
          margin: const EdgeInsets.only(top: 320, left: 5),
          child: Text(
            placeName,
            style: const TextStyle(
                fontFamily: "Lato-Regular",
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );

    //Titulo de la publicación
    final title = Row(
      children: <Widget>[
        //Nombre del perrito
        Container(
          margin: const EdgeInsets.only(
            right: 10,
            left: 30,
            top: 320,
          ),
          child: Text(
            dogName,
            style: const TextStyle(
              fontFamily: "Lato-Regular",
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),

        //Ultimo lugar donde se vió
        lastView,
      ],
    );
    //Devolvemos una pagina de descripción con nombre del perrito, ultima ubicación donde se vió, descripción, comentarios de usuarios, etc.
    final page = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title,
        descriptionBox,
        const AlertButton("Alerta"),
      ],
    );

    return page;
  }
}
