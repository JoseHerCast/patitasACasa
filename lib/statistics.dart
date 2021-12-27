import 'package:flutter/material.dart';

class Statistics extends StatelessWidget {
  const Statistics({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            Column(
              children: [
                const Icon(
                  Icons.favorite,
                  size: 80,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                    bottom: 40,
                  ),
                  child: const Text(
                    "52\nAgradecimientos",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Lato-Regular",
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                const Icon(
                  Icons.pets,
                  size: 80,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                    bottom: 40,
                  ),
                  child: const Text(
                    "27\nDoggies encontrados",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Lato-Regular",
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        TableRow(
          children: [
            Column(
              children: [
                const Icon(
                  Icons.remove_red_eye,
                  size: 80,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                    bottom: 40,
                  ),
                  child: const Text(
                    "10\nBusquedas activas",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Lato-Regular",
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                const Icon(
                  Icons.comment,
                  size: 80,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                    bottom: 40,
                  ),
                  child: const Text(
                    "112\nComentarios",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Lato-Regular",
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
