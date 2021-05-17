import 'package:get/get.dart';

import '../../api.dart';
import '../../types.dart';

class CommentsState extends GetxController {
  final loading = false.obs;
  final comments = <ChildCommentElement>[].obs;
  final end = false.obs;
  int page = 0;
  Target? target;
  late Comment comment;

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
    comments.addAll(comment.data ?? []);
    end.value = comment.paging?.isEnd ?? true;
    loading.value = false;
    page += 1;
  }

  Future<Comment> getComments() {
    return getRootComment(target!, page);
  }
}
