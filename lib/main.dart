import 'package:flutter/gestures.dart';
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

class CustomScrollBehavior extends MaterialScrollBehavior {
  const CustomScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Zhihu',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const MainPage(),
      scrollBehavior: const CustomScrollBehavior(),
      initialBinding: AppBindings(),
    );
  }

  ThemeData get lightTheme {
    final theme = ThemeData.light();
    final textTheme = theme.textTheme;
    return theme.copyWith(
      primaryColor: const Color(0xff0066ff),
      scaffoldBackgroundColor: const Color(0xfff6f6f7),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      textTheme: textTheme.copyWith(
        bodyText1: textTheme.bodyText1?.copyWith(color: Colors.black),
      ),
    );
  }

  ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      cardColor: const Color(0xff1d1d1d),
      scaffoldBackgroundColor: const Color(0xff121212),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff1d1d1d),
        elevation: 0,
      ),
      dividerColor: const Color(0xff212121),
      toggleableActiveColor: const Color(0xff009dff),
    );
  }
}

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppState());
  }
}
