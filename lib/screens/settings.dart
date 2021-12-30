//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ajustes",
          style: TextStyle(
            fontFamily: "Lato-Regular",
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        children: [
          Column(
            children: const [
              SettingsOption(
                description: "Cambiar nombre de perfil",
                icon: Icons.person,
              ),
              SettingsOption(
                description: "Cambiar Ciudad",
                icon: Icons.add_location,
              ),
              SettingsOption(
                description: "Cerrar sesion",
                icon: Icons.exit_to_app,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SettingsOption extends StatelessWidget {
  const SettingsOption({
    required this.description,
    required this.icon,
    Key? key,
  }) : super(key: key);
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.grey.withAlpha(50),
          ),
        ),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.black,
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Text(
                description,
                style: const TextStyle(
                  fontFamily: "Lato-Regular",
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Icon(icon),
            ),
          ],
        ),
      ),
    );
  }
}
