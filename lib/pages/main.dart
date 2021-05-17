import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../state.dart';
import '../widgets/widgets.dart';
import 'login.dart';
import 'recommend/recommend.dart';

class MainPage extends StateWidget<AppState> {
  const MainPage();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (state.cookie.value == null) return const LoginPage();
      if (state.cookie.value?.isEmpty ?? true) return const Loading();

      return const RecommendPage();
    });
  }
}
