import 'package:flutter/material.dart';
import 'package:mafia_tutorial/enums.dart';
import 'package:mafia_tutorial/help_bar.dart';
import 'package:mafia_tutorial/main_button.dart';
import 'package:mafia_tutorial/scenario_card.dart';
import 'package:mafia_tutorial/scenario_card.dart';
import 'package:mafia_tutorial/scenario_card.dart';
import 'package:mafia_tutorial/scenario_card.dart';
import 'package:mafia_tutorial/scenario_card.dart';
import 'package:mafia_tutorial/scenario_card.dart';
import 'package:mafia_tutorial/scenario_card.dart';
import 'package:mafia_tutorial/scenario_card.dart';
import 'package:mafia_tutorial/scenario_card.dart';
import 'package:provider/provider.dart';
import 'package:mafia_tutorial/main.dart';

class ScenariosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppData>();

    double heightStep = 15;
    List<ScenarioCard> scenariosList = [
      ScenarioCard(ScenarioData("مافیا ساده"), () {}),
      ScenarioCard(ScenarioData("پدرخوانده"), () {}),
      ScenarioCard(ScenarioData("تفنگدار"), () {}),
      ScenarioCard(ScenarioData("تروریست"), () {}),
      ScenarioCard(ScenarioData("بازپرس"), () {}),
      ScenarioCard(ScenarioData("مذاکره"), () {}),
      ScenarioCard(ScenarioData("فراماسون"), () {}),
      ScenarioCard(ScenarioData("گرگینه"), () {}),
      ScenarioCard(ScenarioData("جوکر"), () {}),
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
              text: "سناریو ها",
            ),
            const Divider(height: 25),
            Expanded(
              child: ListView(
                // padding: const EdgeInsets.symmetric(horizontal: 80),
                children: [
                  for (final item in scenariosList) ...[
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
