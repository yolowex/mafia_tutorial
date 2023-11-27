import 'package:flutter/material.dart';
import 'package:mafia_tutorial/main.dart';
import 'package:provider/provider.dart';

class ColumnAdjustDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppData>();

    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("تنظیم تعداد ستون ها"),
            Slider(
              value: appState.columnCount,
              min: appState.columnCountMin,
              max: appState.columnCountMax,
              label: appState.columnCount.round().toString(),
              divisions:
                  (appState.columnCountMax - appState.columnCountMin).toInt(),
              onChanged: (newValue) {
                appState.columnCount = newValue;
              },
            ),
          ],
        ),
      ),
    );
  }
}
