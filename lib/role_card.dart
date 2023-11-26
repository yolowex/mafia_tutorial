import 'package:flutter/material.dart';
import 'package:mafia_tutorial/card_dialog.dart';
import 'package:mafia_tutorial/enums.dart';

class CardData {
  final String name;
  final String? details;
  final MafiaSideEnum side;

  CardData({required this.name, this.details, required this.side});
}

class RoleCard extends StatelessWidget {
  final CardData cardData;

  RoleCard({required this.cardData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
            width: 5,
            color: Color.lerp(cardData.side.color, Colors.black, 0.5)!),
        image: const DecorationImage(
            image: AssetImage("assets/images/pic.jpg"), fit: BoxFit.fill),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              color: cardData.side.color.withAlpha(125),
              width: double.infinity,
              height: 35,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(0.0),
              child: Text(cardData.name),
            ),
            Positioned.fill(
                child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: cardData.side.color.withAlpha(125),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CardDialog(cardData);
                      });
                },
              ),
            )),
          ],
        ),
      ),
    );
  }
}
