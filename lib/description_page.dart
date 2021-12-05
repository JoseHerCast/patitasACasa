import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:mi_app_final/my_button.dart';

class DescriptionPage extends StatelessWidget {
  //Nombre del perrito, ubicación y descripción
  late String dogName;
  late String placeName;
  late String description;

  DescriptionPage(this.dogName, this.placeName, this.description);

  @override
  Widget build(BuildContext context) {
    //Contenedor de descripción
    final descriptionBox = Container(
      margin: EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 30,
      ),
      //Texto de descripción
      child: Text(
        this.description,
        style: TextStyle(
          fontFamily: "Lato-Regular",
          fontSize: 15,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
    //Último lugar en que se vió
    final last_view = Row(
      children: [
        //Icono de lugar
        Container(
          margin: EdgeInsets.only(top: 320, left: 10),
          child: Icon(
            Icons.place,
            color: Colors.grey,
          ),
        ),
        //Nombre del lugar
        Container(
          margin: EdgeInsets.only(top: 320, left: 5),
          child: Text(
            this.placeName,
            style: TextStyle(
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
          margin: EdgeInsets.only(
            right: 10,
            left: 30,
            top: 320,
          ),
          child: Text(
            this.dogName,
            style: TextStyle(
              fontFamily: "Lato-Regular",
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),

        //Ultimo lugar donde se vió
        last_view,
      ],
    );
    //Devolvemos una pagina de descripción con nombre del perrito, ultima ubicación donde se vió, descripción, comentarios de usuarios, etc.
    final page = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title,
        descriptionBox,
        MyButton("Alerta"),
      ],
    );

    return page;
  }
}
