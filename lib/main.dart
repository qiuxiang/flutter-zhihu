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
    return ThemeData(
      useMaterial3: true,
      primaryColor: const Color(0xff0066ff),
    );
  }

  ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      cardColor: const Color(0xff1d1d1d),
      scaffoldBackgroundColor: const Color(0xff121212),
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
