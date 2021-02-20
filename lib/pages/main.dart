import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../store.dart';
import '../widgets/widgets.dart';
import 'login.dart';
import 'recommend/recommend.dart';

class MainPage extends StateWidget<Store> {
  const MainPage();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (state.cookie.value == null) return const LoginPage();
      if (state.cookie.value.isEmpty) return const Loading();

      return const RecommendPage();
    });
  }
}
