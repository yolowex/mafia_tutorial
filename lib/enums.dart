import 'package:flutter/material.dart';

enum PageEnum { main, rules, scenarios, roles, morals, idioms }

enum DropdownEnum { changeFontSize, buyVip, shareApp, adjustColumn }

enum MafiaSideEnum {
  mafia(Colors.black87),
  citizens(Colors.white70),
  independent(Colors.red);

  final Color color;
  const MafiaSideEnum(this.color);
}
