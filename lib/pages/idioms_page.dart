import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:mafia_tutorial/enums.dart';
import 'package:mafia_tutorial/help_bar.dart';
import 'package:mafia_tutorial/main.dart';
import 'package:provider/provider.dart';

class IdiomsPage extends StatelessWidget {
  final Function onBackPressed;

  const IdiomsPage({super.key, required this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppData>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Theme.of(context).cardColor.withAlpha(100),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              HelpBar(
                backOnPressed: () {
                  onBackPressed();
                },
                text: "اصطلاحات",
              ),
              const Divider(height: 25),
              Expanded(
                child: ListView(
                  children: [
                    Text(appState.idiomsText,
                        style: appState.mainTextStyle(context))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
