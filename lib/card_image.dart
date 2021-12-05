import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  //Imagen del perrito perdido
  String dogImage;

  CardImage(this.dogImage);

  @override
  Widget build(BuildContext context) {
    //Contenedor para la imagen del perrito
    final card = Container(
      height: 350,
      width: 250,
      margin: EdgeInsets.only(
        top: 80,
        left: 20,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(this.dogImage),
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 15,
            offset: Offset(0, 0.7),
          ),
        ],
      ),
    );

    return card;
  }
}
