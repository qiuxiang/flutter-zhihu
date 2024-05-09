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
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const MainPage(),
      scrollBehavior: const CustomScrollBehavior(),
      initialBinding: AppBindings(),
    );
  }

  ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xff0066ff),
        primary: const Color(0xff0066ff),
      ),
      scaffoldBackgroundColor: const Color(0xfff6f6f6),
    );
  }

  ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: const Color(0xff0066ff),
        primary: const Color(0xff0066ff),
      ),
    );
  }
}

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppState());
  }
}
