import 'package:dio/dio.dart';
import 'package:dio_http2_adapter/dio_http2_adapter.dart';
import 'package:get/get.dart';

import 'state.dart';
import 'types.dart';

const baseUrl = 'https://www.zhihu.com/api/';
final dio = Dio()
  ..options.baseUrl = baseUrl
  ..httpClientAdapter = Http2Adapter(ConnectionManager());

Future request(String path) async {
  final store = Get.find<AppState>();
  if (store.cookie.value?.isNotEmpty ?? false) {
    dio.options.headers['cookie'] = store.cookie.value;
  }
  path = path.replaceAll(baseUrl, '');
  print('request: ${baseUrl + path}');
  final response = await dio.get(baseUrl + path);
  return response.data;
}

Future<Recommend> getRecommend([String? url]) async {
  url = url ?? 'v3/feed/topstory/recommend?limit=10&desktop=true';
  final json = await request(url);
  return Recommend.fromJson(json);
}

Future<Comment> getRootComment(Target target, [int page = 0]) async {
  final t = '${resourceTypeEnumValues.reverse[target.type]}s';
  const limit = 20;
  final json = await request(
      'v4/$t/${target.id}/root_comments?order=normal&limit=$limit&offset=${page * limit}&status=open');
  return Comment.fromJson(json);
}

Future<Comment> getChildComment(int id, [int page = 0]) async {
  const limit = 20;
  final json = await request(
      'v4/comments/$id/child_comments?limit=$limit&offset=${page * limit}');
  return Comment.fromJson(json);
}

Future<List<Target>> getAnswers(int id, [int page = 0]) async {
  const limit = 20;
  const include = 'data[*].excerpt,content,comment_count,voteup_count';
  final json = await request(
      'v4/questions/$id/answers?include=$include&limit=$limit&offset=${page * limit}&platform=desktop&sort_by=default');
  return List<Target>.from(json['data'].map((i) => Target.fromJson(i)));
}
