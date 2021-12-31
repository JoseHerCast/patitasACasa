import 'package:flutter/material.dart';
import 'package:patitas_a_casa/login.dart';
import 'package:patitas_a_casa/profile_header_appbar.dart';
import '../profile_description.dart';
import '../statistics.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
        stream: FirebaseFirestore.instance
            .collection("Usuarios")
            .doc(uid.toString())
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: [
                ListView(
                  children: [
                    ProfileDescription("Acerca de mí", snapshot.data!['city'],
                        snapshot.data!['description']),
                    const Statistics(),
                  ],
                ),
                ProfileHeaderAppBar(snapshot.data!['name'], uid.toString()),
              ],
            );
          } else {
            return Stack(
              children: [
                ListView(
                  children: const [
                    ProfileDescription("Acerca de mí", "Ciudad de México",
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum id nulla at mauris facilisis faucibus. Fusce vel est nec metus ornare egestas ut ac augue. Duis dui lectus, suscipit sit amet magna ultricies, laoreet elementum felis. Vivamus non turpis eu tellus posuere pulvinar sit amet a nisl. Proin quam metus, lobortis ut nunc eu, bibendum tempor nisi. Phasellus eu accumsan urna, et mattis nisl. Proin commodo interdum ante non mollis. Aliquam mattis facilisis neque sit amet euismod."),
                    Statistics(),
                  ],
                ),
                ProfileHeaderAppBar("Nombre", uid.toString()),
              ],
            );
          }
        });
  }
}
