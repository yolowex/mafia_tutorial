import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter/material.dart';
import 'package:mafia_tutorial/enums.dart';
import 'package:mafia_tutorial/main.dart';
import 'package:provider/provider.dart';

class ScenarioData {
  final String name;
  final String picPath;
  late final String details;
  late final String minPlayers;
  late final String maxPlayers;
  late final String hasIndependent;
  late final String difficultyLevel;

  ScenarioData(this.name,
      {this.picPath = "assets/images/pic.jpg",
      required this.details,
      required this.minPlayers,
      required this.maxPlayers,
      required this.hasIndependent,
      required this.difficultyLevel});

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
    return "ساید مستقل: " + hasIndependent;
  }

  String get levelText {
    return "سطح: " + difficultyLevel;
  }
}

class ScenarioCard extends StatefulWidget {
  final ScenarioData data;

  ScenarioCard(this.data);

  @override
  State<ScenarioCard> createState() => _ScenarioCardState();
}

class _ScenarioCardState extends State<ScenarioCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppData>();

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor.withAlpha(200),
              border: Border.all(width: 4),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 140,
                        height: 140,
                        child: Image.asset(widget.data.picPath),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.data.scenarioText,
                                style: appState.h1TextStyle(context)),
                            Text(widget.data.playersCountText,
                                style: appState.h1TextStyle(context)),
                            Text(widget.data.hasIndependentText,
                                style: appState.h1TextStyle(context)),
                            Text(widget.data.levelText,
                                style: appState.h1TextStyle(context)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(),
                Text(
                  widget.data.details,
                  style: appState.mainTextStyle(context),
                  maxLines: isExpanded ? null : 3,
                  overflow: TextOverflow.fade,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.black.withAlpha(125),
                    borderRadius: BorderRadius.circular(15)),
                child: IconButton(
                    onPressed: () {
                      isExpanded = !isExpanded;

                      setState(() {});
                    },
                    icon: Icon(
                      isExpanded ? Icons.expand_less : Icons.expand_more,
                    )),
              )
            ],
          ),
        )
      ],
    );
  }
}
