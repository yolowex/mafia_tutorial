import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:mafia_tutorial/enums.dart';
import 'package:mafia_tutorial/help_bar.dart';
import 'package:mafia_tutorial/main.dart';
import 'package:provider/provider.dart';

class TechniquesPage extends StatelessWidget {
  const TechniquesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppData>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            HelpBar(
              backOnPressed: () {
                appState.currentPageId = PageEnum.main;
              },
              text: "تکنیک های آموزشی",
            ),
            const Divider(height: 25),
            Expanded(
              child: ListView(
                children: [
                  Text(loremIpsum(words: 200),
                      style: appState.mainTextStyle(context))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
