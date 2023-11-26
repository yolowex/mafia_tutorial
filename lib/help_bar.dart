import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:mafia_tutorial/enums.dart';
import 'package:mafia_tutorial/font_dialog.dart';
import 'package:mafia_tutorial/main.dart';
import 'package:provider/provider.dart';

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