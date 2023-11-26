import 'package:flutter/material.dart';

class RoleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset("assets/images/pic.jpg", fit: BoxFit.fill),
        Container(
          color: Colors.black45.withAlpha(125),
          width: double.infinity,
          height:  30,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: const Text("Lorem Ipsum"),
        ),
      ],
    );
  }
}
