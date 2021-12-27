//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/painting.dart';
//import 'package:flutter/widgets.dart';

class ProfileDescription extends StatelessWidget {
  //Nombre del perrito, ubicación y descripción
  final String titleText;
  final String placeName;
  final String description;

  const ProfileDescription(this.titleText, this.placeName, this.description,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Contenedor de descripción
    final descriptionBox = Container(
      margin: const EdgeInsets.all(30),
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
    final from = Row(
      children: [
        //Icono de lugar
        Container(
          margin: const EdgeInsets.only(
            top: 320,
            left: 30,
          ),
          child: const Icon(
            Icons.place,
            color: Colors.grey,
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 320,
            left: 5,
          ),
          child: Text(
            "Vive en",
            style: const TextStyle(
                fontFamily: "Lato-Regular",
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
        //Nombre del lugar
        Container(
          margin: const EdgeInsets.only(
            top: 320,
            left: 5,
          ),
          child: Text(
            placeName,
            style: const TextStyle(
                fontFamily: "Lato-Regular",
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );

    //Titulo de la publicación
    final title = Column(
      children: <Widget>[
        //Ultimo lugar donde se vió
        from,
      ],
    );
    //Devolvemos una pagina de descripción con nombre del perrito, ultima ubicación donde se vió, descripción, comentarios de usuarios, etc.
    final page = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title,
        descriptionBox,
      ],
    );

    return page;
  }
}
