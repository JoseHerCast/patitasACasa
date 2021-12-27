import 'package:flutter/material.dart';
import 'package:patitas_a_casa/screens/settings.dart';
import 'components/edit_button.dart';
import 'components/gradient_background.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key? key,
    required this.userName,
    required this.eMail,
  }) : super(key: key);

  final String userName;
  final String eMail;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        GradientBack("Perfil"),
        Positioned(
          top: 110,
          left: 40,
          child: Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey.shade800,
                    backgroundImage: AssetImage("assets/img/profile.jpg"),
                  ),
                  Positioned(
                    left: -5,
                    top: 60,
                    child: EditButton(),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      left: 25,
                    ),
                    child: Text(
                      userName,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontFamily: "Lato-Regular",
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 25,
                    ),
                    child: Text(
                      eMail,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontFamily: "Lato-Regular",
                        fontSize: 14,
                        color: Colors.white60,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 225,
          left: MediaQuery.of(context).size.width / 16,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.settings,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Settings(),
                          ),
                        );
                      },
                    ),
                    Text(
                      "Ajustes",
                      style: TextStyle(
                        fontFamily: "Lato-Regular",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.lightbulb,
                      ),
                      onPressed: () {},
                    ),
                    Text(
                      "Nueva alerta",
                      style: TextStyle(
                        fontFamily: "Lato-Regular",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.pets),
                      onPressed: () {},
                    ),
                    Text(
                      "Mis doggies",
                      style: TextStyle(
                        fontFamily: "Lato-Regular",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
