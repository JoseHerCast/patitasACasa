import 'package:flutter/material.dart';
import 'package:patitas_a_casa/profile_header_appbar.dart';

import '../profile_description.dart';
import '../statistics.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: const [
            ProfileDescription("Acerca de mí", "Ixtapaluca",
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum id nulla at mauris facilisis faucibus. Fusce vel est nec metus ornare egestas ut ac augue. Duis dui lectus, suscipit sit amet magna ultricies, laoreet elementum felis. Vivamus non turpis eu tellus posuere pulvinar sit amet a nisl. Proin quam metus, lobortis ut nunc eu, bibendum tempor nisi. Phasellus eu accumsan urna, et mattis nisl. Proin commodo interdum ante non mollis. Aliquam mattis facilisis neque sit amet euismod."),
            Statistics(),
          ],
        ),
        const ProfileHeaderAppBar(
            "Joss Hernández", "carrousel.182@hotmail.com"),
      ],
    );
  }
}
