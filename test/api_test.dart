import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:zhihu/api.dart';
import 'package:zhihu/state.dart';

void main() {
  Get.lazyPut(() => AppState());
  test('get recommends', () async {
    var recommend = await getRecommends();
    print(recommend['paging']['next']);
    recommend = await getRecommends(recommend['paging']['next']);
    print(recommend['freshText']);
  });
}
