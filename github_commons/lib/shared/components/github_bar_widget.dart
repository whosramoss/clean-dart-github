import 'package:flutter/material.dart';

class GithubAppBarWidget extends StatelessWidget {
  const GithubAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("My Profile", style: TextStyle(color: Colors.white)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: const BackButton(color: Colors.white),
    );
  }
}
