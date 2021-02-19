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
      if (state.cookie.value.isEmpty) {
        return Scaffold(
          body: Center(
            child: RaisedButton(
              onPressed: () => Get.to(const LoginPage()),
              child: const Text('登录'),
            ),
          ),
        );
      }
      return const RecommendPage();
    });
  }
}
