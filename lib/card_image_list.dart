import 'package:flutter/material.dart';
import 'components/card_image.dart';

class CardImageList extends StatelessWidget {
  const CardImageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Lista horizontal de perritos perdidos(aún falta coordinar con las descripciones propias)
    return SizedBox(
      height: 350,
      child: ListView(
        padding: const EdgeInsets.all(25),
        scrollDirection: Axis.horizontal,
        children: const <Widget>[
          CardImage("assets/img/doggie1.jpg"),
          CardImage("assets/img/doggie2.jpg"),
          CardImage("assets/img/doggie3.jpg"),
          CardImage("assets/img/doggie4.jpg"),
        ],
      ),
    );
  }
}
