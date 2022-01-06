import 'package:flutter/material.dart';
import '../doggie_card.dart';

class Doggies extends StatelessWidget {
  const Doggies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mis doggies",
          style: TextStyle(
            fontFamily: "Lato-Regular",
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        children: [
          Card(
            shadowColor: Colors.grey,
            elevation: 8,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: const DoggieCard(
                "assets/img/doggie1.jpg", "Lui", "Chalco", "Edo. de Mexico"),
          ),
          Card(
            shadowColor: Colors.grey,
            elevation: 8,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: const DoggieCard(
                "assets/img/doggie2.jpg", "Tobi", "La paz", "Edo. de Mexico"),
          ),
          Card(
            shadowColor: Colors.grey,
            elevation: 8,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: const DoggieCard("assets/img/doggie3.jpg", "Bongo",
                "Ixtapaluca", "Edo. de Mexico"),
          ),
          Card(
            shadowColor: Colors.grey,
            elevation: 8,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: const DoggieCard("assets/img/doggie4.jpg", "Coco",
                "Ixtapaluca", "Edo. de Mexico"),
          ),
          Card(
            shadowColor: Colors.grey,
            elevation: 8,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: const DoggieCard(
                "assets/img/doggie5.jpg", "Rulo", "Iztapalapa", "CDMX"),
          ),
          Card(
            shadowColor: Colors.grey,
            elevation: 8,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: const DoggieCard(
                "assets/img/doggie6.jpg", "Keily", "Iztacalco", "CDMX"),
          ),
        ],
      ),
    );
  }
}
