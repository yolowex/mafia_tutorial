import 'package:flutter/material.dart';
import 'package:mafia_tutorial/enums.dart';
import 'package:mafia_tutorial/help_bar.dart';
import 'package:mafia_tutorial/main_button.dart';
import 'package:provider/provider.dart';
import 'package:mafia_tutorial/main.dart';

class ScenariosPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppData>();

    double heightStep = 75;
    List<MainButton> buttonsList = [
      MainButton("مافیا ساده", () {}),
      MainButton("پدرخوانده", () {}),
      MainButton("تفنگدار", () {}),
      MainButton("تروریست", () {}),
      MainButton("بازپرس", () {}),
      MainButton("مذاکره", () {}),
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            HelpBar(
              backOnPressed: () {
                appState.currentPageId = PageEnum.main;
              },
              iconColor: Colors.red.shade500.withAlpha(200),
            ),
            Divider(height: 25, color: Colors.red.shade500.withAlpha(100)),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                children: [
                  for (final item in buttonsList) ...[
                    item,
                    SizedBox(height: heightStep)
                  ]
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}