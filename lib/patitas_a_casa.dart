import 'package:flutter/material.dart';
import 'screens/notifications.dart';
import 'screens/profile.dart';
import 'screens/search.dart';

import 'screens/home.dart';

class PatitasACasa extends StatefulWidget {
  const PatitasACasa({Key? key}) : super(key: key);

  @override
  _PatitasACasaState createState() => _PatitasACasaState();
}

class _PatitasACasaState extends State<PatitasACasa> {
  //Indice del navItem
  int indexTap = 0;
  //Arreglo de vistas
  final List<Widget> navButtons = [
    const Home(),
    const Search(),
    const Notifications(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //El body depende de nuestro arreglo de vistas y el indice del navItem seleccionado
      body: navButtons[indexTap],
      //Barra de navegación
      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: Colors.deepOrange,
          primaryColor: Colors.purple,
        ),
        child: BottomNavigationBar(
          //Acción
          onTap: (int index) {
            setState(() {
              indexTap = index;
            });
          },
          //Indice del item
          currentIndex: indexTap,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Inicio",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Buscar",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Notificaciones",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Perfil",
            ),
          ],
        ),
      ),
    );
  }
}
