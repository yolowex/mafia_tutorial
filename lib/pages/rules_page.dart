import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:mafia_tutorial/enums.dart';
import 'package:mafia_tutorial/help_bar.dart';
import 'package:mafia_tutorial/main.dart';
import 'package:provider/provider.dart';

class RulesPage extends StatelessWidget {
  final Function onBackPressed;
  const RulesPage({super.key, required this.onBackPressed});

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
                onBackPressed();
              },
              text: "قوانین مافیا",
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
