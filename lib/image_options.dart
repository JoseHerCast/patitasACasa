import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageOptions extends StatefulWidget {
  ImageOptions({Key? key}) : super(key: key);

  @override
  _ImageOptionsState createState() => _ImageOptionsState();
}

class _ImageOptionsState extends State<ImageOptions> {
  late PickedFile imageFile;
  final ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Elige tu imagen",
            style: TextStyle(
              fontSize: 20,
              fontFamily: "Lato-Regular",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  right: 20,
                ),
                child: TextButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                  icon: Icon(Icons.camera),
                  label: Text(
                    "Camara",
                    style: TextStyle(
                      fontFamily: "Lato-Regular",
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 20,
                ),
                child: TextButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                  icon: Icon(Icons.image),
                  label: Text(
                    "Galería",
                    style: TextStyle(
                      fontFamily: "Lato-Regular",
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await picker.pickImage(
      source: source,
    );
    setState(() {
      imageFile = pickedFile as PickedFile;
    });
  }
}
