import 'package:flutter/material.dart';
import 'package:mi_app_final/comment_list.dart';
import 'package:mi_app_final/description_page.dart';
import 'package:mi_app_final/gradient_background.dart';
import 'package:flutter/services.dart';
import 'package:mi_app_final/header_appbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Barra de notificaciones transparente
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    //Descripción dummy de muestra
    String descDummy =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum id nulla at mauris facilisis faucibus. Fusce vel est nec metus ornare egestas ut ac augue. Duis dui lectus, suscipit sit amet magna ultricies, laoreet elementum felis. Vivamus non turpis eu tellus posuere pulvinar sit amet a nisl. Proin quam metus, lobortis ut nunc eu, bibendum tempor nisi. Phasellus eu accumsan urna, et mattis nisl. Proin commodo interdum ante non mollis. Aliquam mattis facilisis neque sit amet euismod.";
    return MaterialApp(
      title: 'Patitas a casa',
      home: Scaffold(
        //Apilamos un listview con la descripción y el header con las imagenes de perritos
        body: Stack(
          children: <Widget>[
            //Descripción del perrito actual, boton de alerta y comentarios
            ListView(
              children: [
                DescriptionPage("Bongo", "Ixtapaluca", descDummy),
                CommentList(),
              ],
            ),
            //Imagenes de perritos cercanos
            HeaderAppBar(),
          ],
        ),
      ),
    );
  }
}
