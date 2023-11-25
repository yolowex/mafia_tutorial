import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:mafia_tutorial/main.dart';
import 'package:provider/provider.dart';

import 'main_button.dart';

enum PageEnum { main, rules, scenarios, roles, morals, idioms }
enum DropdownEnum { fontIncrease, fontDecrease, buyVip, shareApp }

class HelpBar extends StatelessWidget {
  final void Function() backOnPressed;

  HelpBar({required this.backOnPressed});

  Widget goBackButton() {
    return IconButton(
      onPressed: backOnPressed,
      icon: const Icon(Icons.keyboard_return),
    );
  }

  Widget dropdown(BuildContext context) {
    var appState = context.watch<AppData>();

    return DropdownButton2(
      underline: const SizedBox.shrink(),
      isExpanded: false,
      customButton: const Icon(Icons.more_vert),

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
        if (selected == DropdownEnum.fontIncrease.name){
          appState.increaseFontSize();
        }else if (selected == DropdownEnum.fontDecrease.name){
          appState.decreaseFontSize();
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
            MainButton("سناریو ها", null),
            MainButton("نقش ها", null),
            MainButton("مرام نامه مافیا", null),
            MainButton("اصطلاحات", null),
            MainButton("تکنیک ها", null),
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
