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
import 'package:provider/provider.dart';

import '../main_button.dart';

class PageManager extends StatefulWidget {
  PageManager({super.key});

  @override
  State<PageManager> createState() => _PageManagerState();
}

class _PageManagerState extends State<PageManager> {
  PageEnum _currentPageId = PageEnum.main;

  PageEnum get currentPageId {
    return _currentPageId;
  }

  set currentPageId(PageEnum newValue) {
    setState(() {
      _currentPageId = newValue;
    });
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
              currentPageId = PageEnum.rules;
            }),
            MainButton("سناریو ها", () {
              currentPageId = PageEnum.scenarios;
            }),
            MainButton("نقش ها", () {
              currentPageId = PageEnum.roles;
            }),
            MainButton("اصطلاحات", () {
              currentPageId = PageEnum.idioms;
            }),
            MainButton("مرام نامه مافیا", () {
              currentPageId = PageEnum.morals;
            }),
          ],
        ),
      ),
    );
  }

  void onBackPressed() {
    currentPageId = PageEnum.main;
  }

  @override
  Widget build(BuildContext context) {
    Widget? currentPage;
    var appState = context.watch<AppData>();
    appState.onBackPressed ??= onBackPressed;

    if (currentPageId == PageEnum.rules) {
      currentPage = RulesPage(
        onBackPressed: onBackPressed,
      );
    } else if (currentPageId == PageEnum.scenarios) {
      currentPage = ScenariosPage(
        onBackPressed: onBackPressed,
      );
    } else if (currentPageId == PageEnum.roles) {
      currentPage = RolesPage(
        onBackPressed: onBackPressed,
      );
    } else if (currentPageId == PageEnum.idioms) {
      currentPage = IdiomsPage(
        onBackPressed: onBackPressed,
      );
    } else if (currentPageId == PageEnum.morals) {
      currentPage = MoralsPage(
        onBackPressed: onBackPressed,
      );
    } else if (currentPageId == PageEnum.main) {
      currentPage = mainPage(context);
    } else {
      throw Exception("No bro.. you failed! $currentPage");
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
