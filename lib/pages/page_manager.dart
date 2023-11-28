import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:mafia_tutorial/enums.dart';
import 'package:mafia_tutorial/help_bar.dart';
import 'package:mafia_tutorial/main.dart';
import 'package:mafia_tutorial/pages/idioms_page.dart';
import 'package:mafia_tutorial/pages/morales_page.dart';
import 'package:mafia_tutorial/pages/roles_page.dart';
import 'package:mafia_tutorial/pages/rules_page.dart';
import 'package:mafia_tutorial/pages/scenarios_page.dart';
import 'package:mafia_tutorial/pages/techniques_page.dart';
import 'package:provider/provider.dart';

import '../main_button.dart';

class PageManager extends StatefulWidget {
  const PageManager({super.key});

  @override
  State<PageManager> createState() => _PageManagerState();
}

class _PageManagerState extends State<PageManager> {
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
            MainButton("نقش ها", () {
              appState.currentPageId = PageEnum.roles;
            }),
            MainButton("اصطلاحات", () {
              appState.currentPageId = PageEnum.idioms;
            }),
            MainButton("تکنیک های آموزشی", () {
              appState.currentPageId = PageEnum.techniques;
            }),
            MainButton("مرام نامه مافیا", () {
              appState.currentPageId = PageEnum.morals;
            }),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget currentPage;
    var appState = context.watch<AppData>();

    if (appState.currentPageId == PageEnum.rules) {
      currentPage = RulesPage();
    } else if (appState.currentPageId == PageEnum.scenarios) {
      currentPage = ScenariosPage();
    } else if (appState.currentPageId == PageEnum.roles) {
      currentPage = RolesPage();
    } else if (appState.currentPageId == PageEnum.idioms) {
      currentPage = IdiomsPage();
    } else if (appState.currentPageId == PageEnum.morals) {
      currentPage = MoralsPage();
    } else if (appState.currentPageId == PageEnum.techniques) {
      currentPage = TechniquesPage();
    } else {
      currentPage = mainPage(context);
    }

    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
            image: AssetImage("assets/images/wallpaper.jpg"), fit: BoxFit.fill),
      ),
      child: currentPage,
    );
  }
}
