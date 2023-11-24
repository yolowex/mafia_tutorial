import 'package:flutter/material.dart';

class MainButton extends StatefulWidget {
  final String text;

  MainButton(this.text, {super.key});

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  final TextStyle textStyle1 =
      TextStyle(fontSize: 30, color: Colors.red.shade500);
  final TextStyle textStyle2 =
      TextStyle(fontSize: 30, color: Colors.red.shade900);

  bool isTapping = false;

  @override
  Widget build(BuildContext context) {
    // todo: find bug reason
    var currentStyle = isTapping? textStyle2 : textStyle1;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 3, color: Colors.black54),
        image: const DecorationImage(
            image: AssetImage("assets/images/dark_oak.jpeg"), fit: BoxFit.fill),
      ),
      padding: const EdgeInsets.all(0.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: const Color.fromARGB(80, 220, 155, 155),
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
          onTapDown: (d) {
            setState(() => isTapping = true);
          },
          onTapUp: (d) {
            setState(() => isTapping = false);
          },
          onTapCancel: (

              ) {
            setState(() => isTapping = false);
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                widget.text,
                style: currentStyle
              ),
            ),
          ),
        ),
      ),
    );
  }
}
