import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppState extends GetxController {
  final cookie = Rxn<String>();
  late SharedPreferences store;

  @override
  void onInit() async {
    super.onInit();
    store = await SharedPreferences.getInstance();
    cookie.value = store.getString('cookie');
  }

  void setCookie(String value) {
    cookie.value = value;
    store.setString('cookie', value);
  }
}
