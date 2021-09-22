import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../state.dart';
import '../widgets/widgets.dart';

class LoginPage extends GetxWidget<AppState> {
  const LoginPage();

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: const Color(0xff0066ff),
        shadowColor: Colors.transparent,
      ),
      body: WebView(
        initialUrl: 'https://www.zhihu.com/signin',
        javascriptMode: JavascriptMode.unrestricted,
        onPageStarted: onPageStarted,
      ),
    );
  }

  void onPageStarted(_) async {
    final manager = WebviewCookieManager();
    final cookies = await manager.getCookies('https://www.zhihu.com');
    if (cookies.where((i) => i.name == 'z_c0').isNotEmpty) {
      final cookie = cookies.map((i) => '${i.name}=${i.value}').join(';');
      state.setCookie(cookie);
      Get.back();
    }
  }
}
