import 'package:flutter/material.dart';
import 'package:mafia_tutorial/main_button.dart';
import 'package:provider/provider.dart';
import 'package:mafia_tutorial/page_manager.dart';
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
    (DropdownEnum.fontIncrease, "افزایش سایز متن"),
    (DropdownEnum.fontDecrease, "کاهش سایز متن"),
    (DropdownEnum.buyVip, "خرید نسخه وی ای پی"),
    (DropdownEnum.shareApp, "پیشنهاد برنامه به دیگران"),
  ];

  double _textFontSize = 20;
  final double _textFontSizeMax = 30;
  final double _textFontSizeMin = 12;

  double get textFontSize {
    return _textFontSize;
  }

  void increaseFontSize() {
    _textFontSize+=2;
    if (_textFontSize > _textFontSizeMax) {
      _textFontSize = _textFontSizeMax;
    }

    notifyListeners();
  }

  void decreaseFontSize() {
    _textFontSize-=2;
    if (_textFontSize < _textFontSizeMin) {
      _textFontSize = _textFontSizeMin;
    }

    notifyListeners();
  }
}
