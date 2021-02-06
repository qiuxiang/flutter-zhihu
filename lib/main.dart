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
      darkTheme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
