import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:mafia_tutorial/enums.dart';
import 'package:mafia_tutorial/main.dart';
import 'package:mafia_tutorial/pages/picture_dialog.dart';
import 'package:mafia_tutorial/role_card.dart';
import 'package:provider/provider.dart';

class CardDialog extends StatelessWidget {
  final CardData cardData;

  CardDialog(this.cardData);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppData>();

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: 500,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 7),
        decoration: BoxDecoration(
          color: Color.lerp(
              cardData.side.color, Theme.of(context).primaryColor, 0.7),
          border:
              Border.all(width: 5, color: cardData.side.color.withAlpha(155)),
          borderRadius: BorderRadius.circular(25),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DropCapText(
                style: appState.mainTextStyle(context),
                loremIpsum(words: 100, paragraphs: 4),
                dropCap: DropCap(
                  width: 130,
                  height: 130,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, top: 5),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image.asset(
                          cardData.picPath,
                          fit: BoxFit.fill,
                        ),
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
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return PictureDialog(cardData);
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        // Text(cardData.name),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
