import 'package:test/test.dart';
import 'package:zhihu/api.dart';

void main() {
  test('get recommends', () async {
    var recommend = await getRecommend();
    print(recommend.paging.next);
    recommend = await getRecommend(recommend.paging.next);
    print(recommend.freshText);
  });
}
