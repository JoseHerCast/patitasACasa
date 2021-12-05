import 'package:flutter/material.dart';
import 'components/comment.dart';

class CommentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Lista de comentarios
    return Container(
      margin: EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Titulo de la seccion
          Container(
            margin: EdgeInsets.only(
              left: 20,
              top: 10,
              bottom: 10,
            ),
            child: Text(
              "Todos los comentarios",
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
          ),
          Comment("assets/img/guy1.jpg", "Jhon Ricardo",
              "0 comentarios 0 doggies", "creo que lo vi en..."),
          Comment("assets/img/profile.jpg", "Joss Hernández",
              "5 comentarios 3 doggies", "Andaba uno parecido en..."),
          Comment("assets/img/girl1.jpg", "Lucía R", "12 comentarios 1 doggies",
              "yo también ví uno similar..."),
        ],
      ),
    );
  }
}
