import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:mafia_tutorial/enums.dart';
import 'package:mafia_tutorial/main.dart';
import 'package:provider/provider.dart';

class ScenarioData {
  final String name;
  final String picPath;
  late final String details;
  late final int minPlayers;
  late final int maxPlayers;
  late final bool hasIndependent;
  late final DifficultyLevel difficultyLevel;

  ScenarioData(
    this.name, {
    this.picPath = "assets/images/pic.jpg",
    details,
  }) {
    this.details = details ?? loremIpsum(words: 60);
    minPlayers = 10;
    maxPlayers = 15;
    hasIndependent = false;
    difficultyLevel = DifficultyLevel.easy;
  }

  String get scenarioText {
    return "سناریو: " + name;
  }

  String get playersCountText {
    return "تعداد افراد: " +
        minPlayers.toString() +
        "~" +
        maxPlayers.toString();
  }

  String get hasIndependentText {
    String t = hasIndependent ? "دارد" : "ندارد";
    return "ساید مستقل: " + t;
  }

  String get levelText {
    return "سطح: " + difficultyLevel.text;
  }
}

class ScenarioCard extends StatelessWidget {
  final ScenarioData data;
  final void Function() onClick;

  ScenarioCard(this.data, this.onClick);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppData>();

    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.all(width: 4),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.asset(data.picPath),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(data.scenarioText,
                              style: appState.h1TextStyle(context)),
                          Text(data.playersCountText,
                              style: appState.h1TextStyle(context)),
                          Text(data.hasIndependentText,
                              style: appState.h1TextStyle(context)),
                          Text(data.levelText,
                              style: appState.h1TextStyle(context)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Text(
                data.details,
                style: appState.h2TextStyle(context),
                maxLines: 3,
                overflow: TextOverflow.fade,
              )
            ],
          ),
        ));
  }
}
