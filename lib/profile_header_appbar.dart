import 'package:flutter/material.dart';
import 'package:patitas_a_casa/components/edit_button.dart';
import 'package:patitas_a_casa/description_page.dart';
import 'package:patitas_a_casa/profile_description.dart';
import 'package:patitas_a_casa/profile_header.dart';
import 'components/gradient_background.dart';

class ProfileHeaderAppBar extends StatelessWidget {
  const ProfileHeaderAppBar(this.userName, this.eMail, {Key? key})
      : super(key: key);
  final String userName;
  final String eMail;

  @override
  Widget build(BuildContext context) {
    return ProfileHeader(userName: userName, eMail: eMail);
  }
}
