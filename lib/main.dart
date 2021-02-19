import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'pages/main.dart';
import 'store.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lightTheme = ThemeData.light();
    final lightTextTheme = lightTheme.textTheme;
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme.copyWith(
        primaryColor: const Color(0xff0066ff),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          titleSpacing: 0,
        ),
        textTheme: lightTheme.textTheme.copyWith(
          bodyText2: lightTextTheme.bodyText2.copyWith(
            color: Colors.black87.withOpacity(0.72),
          ),
          caption: lightTextTheme.caption.copyWith(
            color: const Color(0xff8590a6),
          ),
        ),
      ),
      darkTheme: ThemeData.dark(),
      home: const MainPage(),
      initialBinding: AppBindings(),
    );
  }
}

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Store());
  }
}
