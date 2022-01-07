import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: const [
            NotificationCard(
              message:
                  "El usuario UserName ha emitido una alerta para el doggie DoggieName",
              image: AssetImage("assets/img/default.jpeg"),
            ),
            NotificationCard(
              message: "Se creó una nueva alerta para el doggie DoggieName",
              image: AssetImage("assets/img/notification.jpg"),
            ),
            NotificationCard(
              message: "El usuario UserName ¡te ha dado un agradecimiento!",
              image: AssetImage("assets/img/default.jpeg"),
            ),
            NotificationCard(
              message:
                  "Respondieron a tu comentario en la busqueda de DoggieName",
              image: AssetImage("assets/img/notification.jpg"),
            ),
          ],
        ),
      ],
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    required this.message,
    required this.image,
    Key? key,
  }) : super(key: key);

  final String message;
  final AssetImage image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundImage: image,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Text(message),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 10.0,
                    left: 20,
                  ),
                  child: Text(
                    DateFormat('yyyy-MM-DD hh:mm:ss').format(DateTime.now()),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
