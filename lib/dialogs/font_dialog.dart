import 'package:flutter/material.dart';
import 'package:mafia_tutorial/main.dart';
import 'package:provider/provider.dart';

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
              divisions:
                  (appState.textFontSizeMax - appState.textFontSizeMin).toInt(),
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
