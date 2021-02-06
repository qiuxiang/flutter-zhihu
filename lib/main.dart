import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/home.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          titleSpacing: 0,
        ),
      ),
      darkTheme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
