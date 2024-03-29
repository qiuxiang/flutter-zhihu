import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../state.dart';
import '../widgets/widgets.dart';
import 'home.dart';
import 'login.dart';

class MainPage extends GetxWidget<AppState> {
  const MainPage();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (state.cookie.value == null) return const LoginPage();
      if (state.cookie.value?.isEmpty ?? true) return const Loading();

      return const HomePage();
    });
  }
}
