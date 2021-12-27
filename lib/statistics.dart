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
                Icon(
                  Icons.favorite,
                  size: 80,
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                    bottom: 40,
                  ),
                  child: Text(
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
                Icon(
                  Icons.pets,
                  size: 80,
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                    bottom: 40,
                  ),
                  child: Text(
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
                Icon(
                  Icons.remove_red_eye,
                  size: 80,
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                    bottom: 40,
                  ),
                  child: Text(
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
                Icon(
                  Icons.comment,
                  size: 80,
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                    bottom: 40,
                  ),
                  child: Text(
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
