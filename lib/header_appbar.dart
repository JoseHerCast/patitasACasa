import 'package:flutter/material.dart';
import 'package:mi_app_final/card_image_list.dart';
import 'package:mi_app_final/gradient_background.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Apilamos el gradiente de color de fondo y la lista de imagenes de perritos perdidos cercanos
    return Stack(
      children: <Widget>[
        GradientBack("Cercanos"),
        CardImageList(),
      ],
    );
  }
}
