import 'package:flutter/material.dart';
import 'comment.dart';

class CommentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Lista de comentarios
    return Column(
      children: [
        Comment("assets/img/guy1.jpg", "Jhon Ricardo",
            "0 comentarios 0 doggies", "creo que lo vi en..."),
        Comment("assets/img/profile.jpg", "Joss Hernández",
            "5 comentarios 3 doggies", "Andaba uno parecido en..."),
        Comment("assets/img/girl1.jpg", "Lucía R", "12 comentarios 1 doggies",
            "yo también ví uno similar..."),
      ],
    );
  }
}
