import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:mafia_tutorial/enums.dart';
import 'package:mafia_tutorial/help_bar.dart';
import 'package:mafia_tutorial/main.dart';
import 'package:mafia_tutorial/role_card.dart';
import 'package:provider/provider.dart';

class RolesPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppData>();

    return SafeArea(
      child: Column(
        children: [
          HelpBar(backOnPressed: () {
            appState.currentPageId = PageEnum.main;
          }),
          const Divider(height: 25),
          Expanded(
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(10),
              crossAxisSpacing: 5,
              mainAxisSpacing: 15,
              crossAxisCount: 2,
              children: <Widget>[
                for (final _ in List.filled(25, 0))
                  RoleCard()
              ],
            )
          ),
        ],
      ),
    );
  }
}