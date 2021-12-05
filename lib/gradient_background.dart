import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {
  //Titulo de la appbar personalizada
  String title = "Cercanos";

  GradientBack(this.title);

  @override
  Widget build(BuildContext context) {
    //Gradiente de color con un titulo (appbar personalizada)
    return Container(
      height: 300,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.deepOrange,
            Colors.orange,
          ],
          begin: FractionalOffset(0.2, 0.0),
          end: FractionalOffset(1.0, 0.6),
          stops: [0.0, 0.6],
          tileMode: TileMode.clamp,
        ),
      ),
      //Texto del gradiente
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontFamily: "Lato-Regular",
          fontWeight: FontWeight.w700,
        ),
      ),
      alignment: Alignment(-0.8, -0.6),
    );
  }
}
