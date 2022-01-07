import 'package:flutter/material.dart';
import '../comment_list.dart';
import '../description_page.dart';
import '../header_appbar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //Descripción del perrito actual, boton de alerta y comentarios
        ListView(
          children: const [
            DescriptionPage("Bongo", "Ixtapaluca",
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum id nulla at mauris facilisis faucibus. Fusce vel est nec metus ornare egestas ut ac augue. Duis dui lectus, suscipit sit amet magna ultricies, laoreet elementum felis. Vivamus non turpis eu tellus posuere pulvinar sit amet a nisl. Proin quam metus, lobortis ut nunc eu, bibendum tempor nisi. Phasellus eu accumsan urna, et mattis nisl. Proin commodo interdum ante non mollis. Aliquam mattis facilisis neque sit amet euismod."),
            CommentList(),
          ],
        ),
        //Imagenes de perritos cercanos
        const HeaderAppBar(),
      ],
    );
  }
}
