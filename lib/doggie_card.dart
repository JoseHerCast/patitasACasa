import 'package:flutter/material.dart';

class DoggieCard extends StatelessWidget {
  final image;
  final doggieName;
  final city;
  final state;

  const DoggieCard(
    this.image,
    this.doggieName,
    this.city,
    this.state, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Ink.image(
          image: AssetImage(image),
          height: 240,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
        Positioned(
          bottom: 16,
          right: 16,
          left: 16,
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Colors.black.withAlpha(50),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(
                    doggieName,
                    style: TextStyle(
                      fontFamily: "Lato-Regular",
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Icon(
                    Icons.place,
                    color: Colors.grey.shade500,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(
                      city + ", " + state,
                      style: TextStyle(
                        fontFamily: "Lato-Regular",
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
