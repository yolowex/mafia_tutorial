import 'package:flutter/material.dart';

class RoleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(width: 5, color: Colors.black),
        image: const DecorationImage(
            image: AssetImage("assets/images/pic.jpg"), fit: BoxFit.fill),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              color: Colors.black87.withAlpha(125),
              width: double.infinity,
              height: 35,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              child: const Text("Lorem Ipsum"),
            ),
            Positioned.fill(
                child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.black87.withAlpha(125),
                onTap: () {},
              ),
            )),
          ],
        ),
      ),
    );
  }
}
