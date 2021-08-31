import 'package:dio/dio.dart';
import 'package:dio_http2_adapter/dio_http2_adapter.dart';
import 'package:get/get.dart';

import 'state.dart';

const baseUrl = 'https://www.zhihu.com/api/';
final dio = Dio()..httpClientAdapter = Http2Adapter(ConnectionManager());

Future<Map> request(String path) async {
  final store = Get.find<AppState>();
  if (store.cookie.value?.isNotEmpty ?? false) {
    dio.options.headers['cookie'] = store.cookie.value;
  }
  path = path.replaceAll(baseUrl, '');
  print('request $path');
  final response = await dio.get(baseUrl + path);
  return response.data;
}

Future<Map> getRecommends([String? url]) async {
  url = url ?? 'v3/feed/topstory/recommend?limit=10&desktop=true';
  return request(url);
}

Future<Map> getRootComments(Map target, [int page = 0]) async {
  final t = '${target['type']}s';
  const limit = 20;
  return request(
      'v4/$t/${target['id']}/root_comments?order=normal&limit=$limit&offset=${page * limit}&status=open');
}

Future<Map> getChildComment(int id, [int page = 0]) async {
  const limit = 20;
  return request(
      'v4/comments/$id/child_comments?limit=$limit&offset=${page * limit}');
}

Future<List<Map>> getAnswers(int id, [int page = 0]) async {
  const limit = 20;
  const include = 'data[*].excerpt,content,comment_count,voteup_count';
  final json = await request(
      'v4/questions/$id/answers?include=$include&limit=$limit&offset=${page * limit}&platform=desktop&sort_by=default');
  return json['data'].cast<Map>();
}
