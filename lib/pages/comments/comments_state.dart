import 'package:get/get.dart';

import '../../api.dart';

class CommentsState extends GetxController {
  final loading = false.obs;
  final comments = <Map>[].obs;
  final end = false.obs;
  int page = 0;
  Map? target;
  late Map comment;

  void init() {
    page = 0;
    loading.value = false;
    end.value = false;
    comments.clear();
    fetch();
  }

  void fetch() async {
    if (loading.value || end.value) return;

    loading.value = true;
    comment = await getComments();
    comments.addAll(comment['data'].cast<Map>());
    end.value = comment['paging']['is_end'];
    loading.value = false;
    page += 1;
  }

  Future<Map> getComments() {
    return getRootComments(target!, page);
  }
}
