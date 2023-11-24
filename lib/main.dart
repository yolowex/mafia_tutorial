import 'package:flutter/material.dart';
import 'package:mafia_tutorial/main_button.dart';
import 'package:provider/provider.dart';
import 'package:mafia_tutorial/page_manager.dart';

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
      theme: ThemeData.dark(),
      home: Scaffold(
        body: PageManager()
      ),
    );
  }
}

class AppData extends ChangeNotifier {}
