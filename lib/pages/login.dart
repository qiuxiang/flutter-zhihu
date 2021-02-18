import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../store.dart';
import '../widgets/widgets.dart';

class LoginPage extends StateWidget<Store> {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: const Color(0xff0066ff),
        brightness: Brightness.dark,
      ),
      body: WebView(
        initialUrl: 'https://www.zhihu.com/signin',
        onPageStarted: onPageStarted,
      ),
    );
  }

  void onPageStarted(_) async {
    final manager = WebviewCookieManager();
    final cookies = await manager.getCookies('https://www.zhihu.com');
    final auth =
        cookies.firstWhere((i) => i.name == 'z_c0', orElse: () => null);
    if (auth != null) {
      final cookie = cookies.map((i) => '${i.name}=${i.value}').join(';');
      state.setCookie(cookie);
      Get.back();
    }
  }
}
