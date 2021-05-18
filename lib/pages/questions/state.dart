import 'package:get/get.dart';

import '../../api.dart';

class QuestionState extends GetxController {
  Map? question;
  final answers = <Map>[].obs;
  final end = false.obs;
  final loading = false.obs;
  int page = 0;

  void init() {
    page = 0;
    loading.value = false;
    end.value = false;
    answers.clear();
    fetch();
  }

  void fetch() async {
    if (loading.value || end.value) return;
    loading.value = true;
    final items = await getAnswers(question!['id'], page);
    answers.addAll(items);
    if (items.isEmpty) {
      end.value = true;
    }
    loading.value = false;
    page += 1;
  }
}
