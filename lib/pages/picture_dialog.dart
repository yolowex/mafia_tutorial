import 'package:flutter/material.dart';
import 'package:mafia_tutorial/main.dart';
import 'package:mafia_tutorial/role_card.dart';
import 'package:provider/provider.dart';

class PictureDialog extends StatelessWidget{
  final CardData cardData;

  PictureDialog(this.cardData);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppData>();

    return Dialog(
      child: Image.asset("assets/images/pic.jpg"),
    );
  }
}
