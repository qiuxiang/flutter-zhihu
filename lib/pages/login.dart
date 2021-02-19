import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import '../store.dart';
import '../widgets/widgets.dart';

class LoginPage extends StateWidget<Store> {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final webview = FlutterWebviewPlugin();
    webview.onStateChanged.listen((_) async {
      final manager = WebviewCookieManager();
      final cookies = await manager.getCookies('https://www.zhihu.com');
      final auth =
          cookies.firstWhere((i) => i.name == 'z_c0', orElse: () => null);
      if (auth != null) {
        final cookie = cookies.map((i) => '${i.name}=${i.value}').join(';');
        state.setCookie(cookie);
        Get.back();
      }
    });
    return WebviewScaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: const Color(0xff0066ff),
        shadowColor: Colors.transparent,
        brightness: Brightness.dark,
      ),
      url: 'https://www.zhihu.com/signin',
    );
  }
}