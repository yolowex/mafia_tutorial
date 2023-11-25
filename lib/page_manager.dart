import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:mafia_tutorial/main.dart';
import 'package:provider/provider.dart';

import 'main_button.dart';

enum PageEnum { main, rules, scenarios, roles, morals, idioms }

enum DropdownEnum { changeFontSize, buyVip, shareApp }

class fontDialog extends StatefulWidget {
  @override
  State<fontDialog> createState() => _fontDialogState();
}

class _fontDialogState extends State<fontDialog> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppData>();

    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("تنظیم انداز متن"),
            Slider(
              value: appState.textFontSize,
              min: appState.textFontSizeMin,
              max: appState.textFontSizeMax,
              label: appState.textFontSize.round().toString(),
              divisions: 15,
              onChanged: (newValue) {
                appState.textFontSize = newValue;
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HelpBar extends StatelessWidget {
  final void Function() backOnPressed;
  final Color? iconColor;
  HelpBar({required this.backOnPressed, this.iconColor});

  Widget goBackButton() {
    return IconButton(
      color: iconColor,
      onPressed: backOnPressed,
      icon: const Icon(Icons.keyboard_return),
    );
  }

  Widget dropdown(BuildContext context) {
    var appState = context.watch<AppData>();

    return DropdownButton2(
      underline: const SizedBox.shrink(),
      isExpanded: false,
      customButton: Icon(Icons.more_vert, color: iconColor),
      items: [
        for (final item in appState.dropdownMenuList)
          DropdownMenuItem<String>(
            value: item.$1.name,
            child: Text(item.$2),
          ),
      ],
      dropdownStyleData: DropdownStyleData(
        width: 200,
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
        ),
        offset: const Offset(0, 8),
      ),
      onChanged: (selected) {
        if (selected == DropdownEnum.changeFontSize.name) {
          showDialog(
              context: context,
              builder: (BuildContext context) => fontDialog());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        dropdown(context),
        goBackButton(),
      ],
    );
  }
}

class PageManager extends StatefulWidget {
  const PageManager({super.key});

  @override
  State<PageManager> createState() => _PageManagerState();
}

class _PageManagerState extends State<PageManager> {
  PageEnum currentPageId = PageEnum.main;

  TextStyle textStyle1(BuildContext context) {
    var appState = context.watch<AppData>();
    return TextStyle(
      fontSize: appState.textFontSize,
    );
  }

  Widget mainPage(BuildContext context) {
    return Center(
      child: IntrinsicWidth(
        // stepWidth: 1,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MainButton("قوانین مافیا", () {
              setState(() => currentPageId = PageEnum.rules);
            }),
            MainButton("سناریو ها", () {
              setState(() => currentPageId = PageEnum.scenarios);
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
                setState(() {
                  currentPageId = PageEnum.main;
                });
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

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            HelpBar(backOnPressed: () {
              setState(() {
                currentPageId = PageEnum.main;
              });
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

    if (currentPageId == PageEnum.rules) {
      currentPage = rulesPage;
    }

    if (currentPageId == PageEnum.scenarios) {
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
