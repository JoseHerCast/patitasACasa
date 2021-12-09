import 'package:flutter/material.dart';
import 'card_image_list.dart';
import 'components/gradient_background.dart';

class HeaderAppBar extends StatelessWidget {
  const HeaderAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Apilamos el gradiente de color de fondo y la lista de imagenes de perritos perdidos cercanos
    return Stack(
      children: const <Widget>[
        GradientBack("Recientes"),
        CardImageList(),
      ],
    );
  }
}
