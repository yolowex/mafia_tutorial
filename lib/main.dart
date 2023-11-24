import 'package:flutter/material.dart';
import 'package:mafia_tutorial/main_button.dart';
import 'package:provider/provider.dart';
import 'package:xml/xml.dart';
import 'package:flutter/services.dart';
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
        body: Container(
          height: 2000,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/wallpaper.jpg"),
                  fit: BoxFit.fill
            )
          ),
          child: Center(
            child: IntrinsicWidth(
              // stepWidth: 1,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MainButton("قوانین مافیا"),
                  MainButton("سناریو ها"),
                  MainButton("نقش ها"),
                  MainButton("مرام نامه مافیا"),
                  MainButton("اصطلاحات"),
                  MainButton("تکنیک ها"),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppData extends ChangeNotifier {}
