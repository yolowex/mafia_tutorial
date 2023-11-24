import 'package:flutter/material.dart';

import 'main_button.dart';

enum PageEnum{
  main,
}


class PageManager extends StatefulWidget{
  const PageManager({super.key});


  @override
  State<PageManager> createState() => _PageManagerState();
}

class _PageManagerState extends State<PageManager> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2000,
      decoration: const BoxDecoration(
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
    );
  }
}