import 'package:get/get.dart';

import '../../api.dart';

class HomeState extends GetxController {
  String? next;
  final items = <Map>[].obs;
  bool loading = false;

  Future fetch({bool refresh = false}) async {
    if (loading) return;

    loading = true;
    final recommends = await getRecommends(refresh ? null : next);
    loading = false;
    if (refresh) {
      items.assignAll(recommends['data'].cast<Map>());
    } else {
      items.addAll(recommends['data'].cast<Map>());
    }
    next = recommends['paging']['next'];
  }
}
