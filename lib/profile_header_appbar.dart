import 'package:flutter/material.dart';
import 'package:patitas_a_casa/profile_header.dart';

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
