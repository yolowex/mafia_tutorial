import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mafia_tutorial/enums.dart';
import 'package:mafia_tutorial/main_button.dart';
import 'package:mafia_tutorial/role_card.dart';
import 'package:mafia_tutorial/scenario_card.dart';
import 'package:provider/provider.dart';
import 'package:mafia_tutorial/pages/page_manager.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:xml/xml.dart';
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
  @override
  void initState() {
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
  List<ScenarioCard> scenariosList = [];

  String rulesText = "empty";
  String moralsText = "empty";
  String idiomsText = "empty";

  void Function()? _onBackPressed;

  void Function()? get onBackPressed {
    return _onBackPressed;
  }

  set onBackPressed(void Function()? newValue) {
    _onBackPressed = newValue;
  }

  List<CardData> rolesList = [];

  (DropdownEnum, String) fontResize =
      (DropdownEnum.changeFontSize, "تنظیم اندازه متن");

  (DropdownEnum, String) columnAdjust =
      (DropdownEnum.adjustColumn, "تنظیم ستون");

  List<(DropdownEnum, String)> dropdownMenuList = [
    (DropdownEnum.shareApp, "پیشنهاد برنامه به دیگران"),
  ];

  final double h2FontSize = 21;
  final double h1FontSize = 23;

  double _textFontSize = 19;
  final double textFontSizeMax = 30;
  final double textFontSizeMin = 12;

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
  App({super.key});

  bool didLoadAssets = false;

  Future<String> loadXMLAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  void doAsync(BuildContext context) async {
    var appState = context.watch<AppData>();

    appState.rulesText = await rootBundle.loadString('assets/data/rules.txt');
    appState.moralsText = await rootBundle.loadString('assets/data/morals.txt');
    appState.idiomsText = await rootBundle.loadString('assets/data/idioms.txt');

    String xml = await loadXMLAsset("assets/data/scenarios.xml");

    final document = XmlDocument.parse(xml);
    var t = document.getElement("scenarios")!;
    if (appState.scenariosList.isEmpty) {
      for (final scenario in t.children) {
        if (scenario.getElement("name") != null) {
          var name = scenario.getElement("name")!.innerText;
          var minPlayers = scenario.getElement("minPlayers")!.innerText;
          var maxPlayers = scenario.getElement("maxPlayers")!.innerText;
          var hasIndependent = scenario.getElement("hasIndependent")!.innerText;
          var level = scenario.getElement("level")!.innerText;
          var picName = scenario.getElement("picName")!.innerText;
          var details = scenario.getElement("details")!.innerText;

          ScenarioCard scenarioCard = ScenarioCard(ScenarioData(name,
              picPath: "assets/images/roles/" + picName,
              details: details,
              minPlayers: minPlayers,
              maxPlayers: maxPlayers,
              difficultyLevel: level,
              hasIndependent: hasIndependent));
          appState.scenariosList.add(scenarioCard);
        }
      }
    }

    List<String> assetsPath = [
      "assets/data/mafia_roles.xml",
      "assets/data/citizens_roles.xml",
      "assets/data/independent_roles.xml"
    ];

    if (appState.rolesList.isNotEmpty) {
      return;
    }

    for (final path in assetsPath) {
      String xml = await loadXMLAsset(path);

      final document = XmlDocument.parse(xml);
      var t = document.getElement("roles")!;

      for (final role in t.children) {
        if (role.getElement("name") != null) {
          var name = role.getElement("name")!.innerText;
          var side = role.getElement("side")!.innerText;
          var picName = role.getElement("picName")!.innerText;
          var details = role.getElement("details")!.innerText;

          CardData roleData = CardData(
            name: name,
            side: MafiaSideEnum.getWithString(side),
            picPath: "assets/images/roles/$picName",
            details: details,
          );
          appState.rolesList.add(roleData);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppData>();
    if (!didLoadAssets) {
      doAsync(context);
      didLoadAssets = true;
    }

    return MaterialApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: Locale("fa", "IR"),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: WillPopScope(
        onWillPop: () async {
          if (appState.onBackPressed != null) {
            appState.onBackPressed!();
          }
          return false;
        },
        child: Scaffold(
          body: PageManager(),
        ),
      ),
    );
  }
}
