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
      home: Scaffold(
        body: PageManager()
      ),
    );
  }
}

class AppData extends ChangeNotifier {
  double _textFontSize = 20;
  double _textFontSizeMax = 30;
  double _textFontSizeMin = 12;

  double get textFontSize {
    return _textFontSize;
  }


  void increaseFontSize(){
    _textFontSize ++;
    if (_textFontSize > _textFontSizeMax){
      _textFontSize = _textFontSizeMax;
    }

    notifyListeners();
  }

  void decreaseFontSize(){
    _textFontSize --;
    if (_textFontSize < _textFontSizeMin){
      _textFontSize = _textFontSizeMin;
    }

    notifyListeners();

  }





}
