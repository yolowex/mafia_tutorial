import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mafia_tutorial/enums.dart';
import 'package:mafia_tutorial/main_button.dart';
import 'package:provider/provider.dart';
import 'package:mafia_tutorial/pages/page_manager.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:xml/xml.dart';
import 'dart:io';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(AppEntry());
}

class AppEntry extends StatefulWidget {
  AppEntry({super.key});

  @override
  State<AppEntry> createState() => _AppEntryState();
}

class _AppEntryState extends State<AppEntry> {
  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/data/roles.xml');
  }

  void doAsync() async {
    String xml = await loadAsset();
    final document = XmlDocument.parse(xml);
  }

  @override
  void initState() {
    doAsync();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: App(),
    );
  }
}

class AppData extends ChangeNotifier {
  (DropdownEnum, String) fontResize =
      (DropdownEnum.changeFontSize, "تنظیم اندازه متن");

  (DropdownEnum, String) columnAdjust =
      (DropdownEnum.adjustColumn, "تنظیم ستون");

  List<(DropdownEnum, String)> dropdownMenuList = [
    (DropdownEnum.buyVip, "خرید نسخه وی ای پی"),
    (DropdownEnum.shareApp, "پیشنهاد برنامه به دیگران"),
  ];

  final double h2FontSize = 21;
  final double h1FontSize = 23;

  double _textFontSize = 19;
  final double textFontSizeMax = 30;
  final double textFontSizeMin = 12;
  PageEnum _currentPageId = PageEnum.main;

  double _columnCount = 2;
  final double columnCountMin = 1;
  final double columnCountMax = 3;

  double get columnCount {
    return _columnCount;
  }

  set columnCount(double newValue) {
    _columnCount = newValue;
    notifyListeners();
  }

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

  TextStyle mainTextStyle(BuildContext context) {
    var appState = context.watch<AppData>();
    return TextStyle(
      fontSize: appState.textFontSize,
    );
  }

  TextStyle h2TextStyle(BuildContext context) {
    var appState = context.watch<AppData>();
    return TextStyle(
      fontSize: appState.h2FontSize,
    );
  }

  TextStyle h1TextStyle(BuildContext context) {
    var appState = context.watch<AppData>();
    return TextStyle(
        fontSize: appState.h1FontSize, fontWeight: FontWeight.w500);
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: WillPopScope(
        onWillPop: () async => false,
        child: const Scaffold(
          body: PageManager(),
        ),
      ),
    );
  }
}
