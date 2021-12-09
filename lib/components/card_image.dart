import 'package:flutter/material.dart';
import 'share_button.dart';

class CardImage extends StatelessWidget {
  //Imagen del perrito perdido
  final String dogImage;

  const CardImage(this.dogImage, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Contenedor para la imagen del perrito
    final card = Container(
      height: 350,
      width: 250,
      margin: const EdgeInsets.only(
        top: 80,
        left: 20,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(dogImage),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        shape: BoxShape.rectangle,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 15,
            offset: Offset(0, 0.7),
          ),
        ],
      ),
    );

    return Stack(
      alignment: const Alignment(0.95, 0.95),
      children: [
        card,
        const ShareButton(),
      ],
    );
  }
}
