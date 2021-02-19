import 'package:get/get.dart';

import '../../api.dart';
import '../../types.dart';

class ChildCommentsState extends GetxController {
  final loading = false.obs;
  final comments = <ChildCommentElement>[].obs;
  final end = false.obs;
  int page = 0;
  ChildCommentElement item;

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
    final comment = await getChildComment(item.id, page);
    comments.addAll(comment.data);
    end.value = comment.paging.isEnd;
    loading.value = false;
    page += 1;
  }
}
