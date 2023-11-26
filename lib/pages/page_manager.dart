import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:mafia_tutorial/enums.dart';
import 'package:mafia_tutorial/help_bar.dart';
import 'package:mafia_tutorial/main.dart';
import 'package:provider/provider.dart';

import '../main_button.dart';

class PageManager extends StatefulWidget {
  const PageManager({super.key});

  @override
  State<PageManager> createState() => _PageManagerState();
}

class _PageManagerState extends State<PageManager> {

  TextStyle textStyle1(BuildContext context) {
    var appState = context.watch<AppData>();
    return TextStyle(
      fontSize: appState.textFontSize,
    );
  }

  Widget mainPage(BuildContext context) {
    var appState = context.watch<AppData>();
    return Center(
      child: IntrinsicWidth(
        // stepWidth: 1,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MainButton("قوانین مافیا", () {
              appState.currentPageId = PageEnum.rules;
            }),
            MainButton("سناریو ها", () {
             appState.currentPageId = PageEnum.scenarios;
            }),
            MainButton("نقش ها", null),
            MainButton("مرام نامه مافیا", null),
            MainButton("اصطلاحات", null),
            MainButton("تکنیک ها", null),
          ],
        ),
      ),
    );
  }

  Widget scenariosPage(BuildContext context) {
    var appState = context.watch<AppData>();

    double heightStep = 75;
    List<MainButton> buttonsList = [MainButton("مافیا ساده", () {}),
      MainButton("پدرخوانده", () {}),
      MainButton("تفنگدار", () {}),
      MainButton("تروریست", () {}),
      MainButton("بازپرس", () {}),
      MainButton("مذاکره", () {}),];

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
                  for (final item in buttonsList) ...[item, SizedBox(height: heightStep)]
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget rulesPage(BuildContext context) {
    var appState = context.watch<AppData>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            HelpBar(backOnPressed: () {

                appState.currentPageId = PageEnum.main;

            }),
            const Divider(height: 25),
            Expanded(
              child: ListView(
                children: [
                  Text(loremIpsum(words: 200), style: textStyle1(context))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Function currentPage = mainPage;
    var appState = context.watch<AppData>();


    if (appState.currentPageId == PageEnum.rules) {
      currentPage = rulesPage;
    }

    else if (appState.currentPageId == PageEnum.scenarios) {
      currentPage = scenariosPage;
    }

    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
            image: AssetImage("assets/images/wallpaper.jpg"), fit: BoxFit.fill),
      ),
      child: currentPage(context),
    );
  }
}
