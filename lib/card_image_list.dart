import 'package:flutter/material.dart';
import 'package:mi_app_final/card_image.dart';

class CardImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Lista horizontal de perritos perdidos(aún falta coordinar con las descripciones propias)
    return Container(
      height: 350,
      child: ListView(
        padding: EdgeInsets.all(25),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImage("assets/img/doggie1.jpg"),
          CardImage("assets/img/doggie2.jpg"),
          CardImage("assets/img/doggie3.jpg"),
          CardImage("assets/img/doggie4.jpg"),
        ],
      ),
    );
  }
}
