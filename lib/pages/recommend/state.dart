import 'package:get/get.dart';

import '../../api.dart';
import '../../types.dart';

class HomeState extends GetxController {
  String? next;
  final items = <RecommendDatum>[].obs;
  bool loading = false;

  Future fetch({bool refresh = false}) async {
    if (loading) return;

    loading = true;
    final recommend = await getRecommend(refresh ? null : next);
    loading = false;
    if (refresh) {
      items.assignAll(recommend.data!);
    } else {
      items.addAll(recommend.data!);
    }
    next = recommend.paging?.next;
  }
}
