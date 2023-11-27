import 'package:flutter/material.dart';
import 'package:mafia_tutorial/dialogs/card_dialog.dart';
import 'package:mafia_tutorial/enums.dart';

import 'dialogs/picture_dialog.dart';

class CardData {
  final String name;
  final String? details;
  final MafiaSideEnum side;
  final String picPath;

  const CardData({
    required this.name,
    this.details,
    required this.side,
    this.picPath = "assets/images/pic.jpg",
  });
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
        image: DecorationImage(
            image: AssetImage(cardData.picPath), fit: BoxFit.fill),
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
              child: Text(
                cardData.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: cardData.side == MafiaSideEnum.citizens
                      ? Colors.black
                      : Colors.white,
                ),
              ),
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: cardData.side.color.withAlpha(125),
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return PictureDialog(cardData);
                      },
                    );
                  },
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CardDialog(cardData);
                        });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
