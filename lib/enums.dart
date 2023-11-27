import 'package:flutter/material.dart';

enum PageEnum { main, rules, scenarios, roles, morals, idioms }

enum DropdownEnum { changeFontSize, buyVip, shareApp, adjustColumn }

enum DifficultyLevel {
  easy(0, "ساده"),
  normal(1, "متوسط"),
  hard(2, "پیشرفته"),
  veryHard(3, "فوق پیشرفته");

  final int level;
  final String text;
  const DifficultyLevel(this.level, this.text);
}

enum MafiaSideEnum {
  mafia(Colors.black87),
  citizens(Colors.white70),
  independent(Colors.red);

  final Color color;
  const MafiaSideEnum(this.color);
}
