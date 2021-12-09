//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  //Imágen de perfil, nombre de usuario, detalles de actividad y comentario
  final String profileImage;
  final String userName;
  final String details;
  final String commentary;

  const Comment(this.profileImage, this.userName, this.details, this.commentary,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Comentario del usuario
    final userComment = Container(
      margin: const EdgeInsets.only(
        left: 20,
      ),
      child: Text(
        commentary,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontFamily: "Lato-Regular",
          fontSize: 15,
          fontWeight: FontWeight.w800,
        ),
      ),
    );

    //Información del usuario
    final userInfo = Container(
      margin: const EdgeInsets.only(
        left: 20,
      ),
      child: Text(
        details,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontFamily: "Lato-Regular",
          fontSize: 13,
          color: Colors.grey,
        ),
      ),
    );

    //Nombre de usuario
    final name = Container(
      margin: const EdgeInsets.only(
        left: 20,
      ),
      child: Text(
        userName,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontFamily: "Lato-Regular",
          fontSize: 15,
        ),
      ),
    );
    //Organizamos en columna los detalles del usuario y comentario
    final userDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        name,
        userInfo,
        userComment,
      ],
    );

    //Foto de perfil del comentario/review
    final profilePhoto = Container(
      margin: const EdgeInsets.only(
        top: 20,
        left: 20,
      ),
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(profileImage),
        ),
      ),
    );
    //Organizamos en fila la imagen del perfil y los detalles del usuario y comentario
    return Row(
      children: <Widget>[
        profilePhoto,
        userDetails,
      ],
    );
  }
}
