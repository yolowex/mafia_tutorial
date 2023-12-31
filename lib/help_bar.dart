import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:mafia_tutorial/dialogs/column_adjust_dialog.dart';
import 'package:mafia_tutorial/enums.dart';
import 'package:mafia_tutorial/dialogs/font_dialog.dart';
import 'package:mafia_tutorial/main.dart';
import 'package:provider/provider.dart';
// import 'package:share_plus/share_plus.dart';

class HelpBar extends StatelessWidget {
  final void Function() backOnPressed;
  final Color? iconColor;
  final bool hasFontResize;
  final bool hasColumnAdjust;
  final String text;

  HelpBar(
      {required this.backOnPressed,
      this.iconColor,
      this.hasFontResize = true,
      this.hasColumnAdjust = false,
      this.text = "HelpBar"});

  Widget goBackButton() {
    return IconButton(
      color: iconColor,
      onPressed: backOnPressed,
      icon: const Icon(Icons.keyboard_return),
    );
  }

  Widget dropdown(BuildContext context) {
    var appState = context.watch<AppData>();
    List<(DropdownEnum, String)> newList = appState.dropdownMenuList.toList();
    if (hasFontResize) {
      newList.insert(0, appState.fontResize);
    }

    if (hasColumnAdjust) {
      newList.insert(0, appState.columnAdjust);
    }

    return DropdownButton2(
      underline: const SizedBox.shrink(),
      isExpanded: false,
      customButton: Icon(Icons.menu, color: iconColor),
      items: [
        for (final item in newList)
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
            builder: (BuildContext context) => fontDialog(),
          );
        }
        if (selected == DropdownEnum.adjustColumn.name) {
          showDialog(
            context: context,
            builder: (BuildContext context) => ColumnAdjustDialog(),
          );
        }
        if (selected == DropdownEnum.shareApp.name) {
          // Share.share("whats up!");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppData>();

    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: dropdown(context),
          ),
          Text(this.text, style: appState.h1TextStyle(context)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: goBackButton(),
          ),
        ],
      ),
    );
  }
}
