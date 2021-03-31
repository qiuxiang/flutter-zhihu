import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'pages/main.dart';
import 'state.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Zhihu',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const MainPage(),
      initialBinding: AppBindings(),
    );
  }

  ThemeData get lightTheme {
    final theme = ThemeData.light();
    final textTheme = theme.textTheme;
    return theme.copyWith(
      primaryColor: const Color(0xff0066ff),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        titleSpacing: 0,
      ),
      textTheme: textTheme.copyWith(
        bodyText2: textTheme.bodyText2.copyWith(
          color: Colors.black87.withOpacity(0.72),
        ),
        caption: textTheme.caption.copyWith(
          color: const Color(0xff8590a6),
        ),
      ),
    );
  }

  ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      cardColor: const Color(0xff1d1d1d),
      scaffoldBackgroundColor: const Color(0xff121212),
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xff1d1d1d)),
      dividerColor: const Color(0xff212121),
    );
  }
}

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppState());
  }
}
