import 'package:flutter/material.dart';
import 'package:mafia_tutorial/enums.dart';
import 'package:mafia_tutorial/main_button.dart';
import 'package:provider/provider.dart';
import 'package:mafia_tutorial/pages/page_manager.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

void main() {
  runApp(AppEntry());
}

class AppEntry extends StatelessWidget {
  const AppEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: App(),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(body: PageManager()),
    );
  }
}

class AppData extends ChangeNotifier {
  List<(DropdownEnum, String)> dropdownMenuList = [
    (DropdownEnum.changeFontSize, "تنظیم اندازه متن"),
    (DropdownEnum.buyVip, "خرید نسخه وی ای پی"),
    (DropdownEnum.shareApp, "پیشنهاد برنامه به دیگران"),
  ];

  double _textFontSize = 20;
  final double textFontSizeMax = 30;
  final double textFontSizeMin = 12;
  PageEnum _currentPageId = PageEnum.main;

  PageEnum get currentPageId {
    return _currentPageId;
  }

  set currentPageId(PageEnum newValue) {
    _currentPageId = newValue;
    notifyListeners();
  }

  double get textFontSize {
    return _textFontSize;
  }

  set textFontSize(newValue) {
    _textFontSize = newValue;
    notifyListeners();
  }
}
